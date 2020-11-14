'use strict';

// Importing the model
const AppError = require('../utils/appError');
const catchAsync = require('../utils/catchAsync');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const UserModel = require('../models/UserModel');
const HospitalModel = require('../models/HospitalModel');

// Function to sign up a user
const register = catchAsync(async (req, res, next) => {
  const { admin, hospital } = req.body;
  if (!hospital || !admin)
    return next(new AppError('Invalid body structure', 400));
  const { hospitalName, address, verificationDataURL } = hospital;
  const newHospital = new HospitalModel({
    name: hospitalName,
    address,
    verificationDataURL,
  });
  const createdHospital = await newHospital.save();
  const { name, username, email, password, phone } = admin;
  const newAdmin = new UserModel({
    name,
    username: username.toLowerCase(),
    email,
    password,
    phone,
    role: 'admin',
    hospital: createdHospital._id,
  });
  const createdAdmin = await newAdmin.save();

  sendToken(createdAdmin, createdHospital, 201, res);
});

// Function to login a user
const login = catchAsync(async (req, res, next) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return next(new AppError('Provide valid username and password!', 400));
  }

  const user = await UserModel.findOne({ username }).select('+password');
  if (!user) return next(new AppError('Invalid username or password', 401));

  const correct = await bcrypt.compare(password, user.password);
  if (!correct) return next(new AppError('Invalid username or password', 401));

  const hospital = await HospitalModel.findById(user.hospital);

  sendToken(user, hospital, 201, res);
});

const createUser = catchAsync(async (req, res, next) => {
  const { name, username, email, password, phone, role, ward } = req.body;
  lowerUname = str(username).toLowerCase();
  const newUser = new UserModel({
    name,
    username: lowerUname,
    email,
    password,
    phone,
    role,
    hospital: req.user.hospital,
    ward,
  });
  const user = await newUser.save();
  user.password = undefined;

  res.status(201).json({
    status: 'success',
    data: {
      user,
    },
  });
});

// Signing a token
const signToken = id => {
  return jwt.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });
};

// Send token to client
const sendToken = (user, hospital, statusCode, res) => {
  const token = signToken(user._id);
  user.password = undefined;

  res.status(statusCode).json({
    status: 'success',
    jwt: {
      token,
      expiresIn: process.env.JWT_EXPIRES_IN,
    },
    data: {
      user,
      hospital,
    },
  });
};

module.exports = {
  register,
  login,
  createUser,
};
