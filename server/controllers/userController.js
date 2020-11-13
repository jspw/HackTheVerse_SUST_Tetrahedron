'use strict';

// Importing the model
const AppError = require('../utils/appError');
const catchAsync = require('../utils/catchAsync');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const UserModel = require('../models/UserModel');

// Function to get all users
const getUser = catchAsync(async (req, res, next) => {
  const users = await UserModel.find();
  res.status(200).json({
    status: 'success',
    data: { users },
  });
});

// Function to sign up a user
const signUp = catchAsync(async (req, res, next) => {
  const { name, email, password, nid, phone, dateOfBirth, role } = req.body;
  const newUser = new UserModel({
    name,
    email,
    password,
    nid,
    phone,
    dateOfBirth: new Date(dateOfBirth),
    role,
  });
  const user = await newUser.save();

  sendToken(user, 201, res);
});

// Function to login a user
const login = catchAsync(async (req, res, next) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return next(new AppError('Provide valid email and password!', 400));
  }

  const user = await UserModel.findOne({ email }).select('+password');
  if (!user) return next(new AppError('Invalid email or password', 401));

  const correct = await bcrypt.compare(password, user.password);
  if (!correct) return next(new AppError('Invalid email or password', 401));

  sendToken(user, 201, res);
});

const logout = catchAsync(async (req, res, next) => {
  res.status(200).json({ status: 'success' });
});

// Function to get user by id
const getSingleUser = catchAsync(async (req, res, next) => {
  const user = await UserModel.findById(req.params.id);

  if (!user) return next(new AppError('Not found!', 404));

  res.status(200).json({
    status: 'success',
    data: { user },
  });
});

// Get My Profile
const getMyProfile = catchAsync(async (req, res, next) => {
  res.status(200).json({
    status: 'success',
    data: { user: req.user },
  });
});

// Update Profile
const updateProfile = catchAsync(async (req, res, next) => {
  const name = req.body.name || req.user.name;
  const phone = req.body.phone || req.user.phone;
  const updatedUser = await UserModel.findOneAndUpdate(
    { _id: req.user._id },
    { name, phone },
    { new: true },
  );

  res.status(200).json({
    status: 'success',
    data: { user: updatedUser },
  });
});

// Signing a token
const signToken = id => {
  return jwt.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });
};

// Send token to client
const sendToken = (user, statusCode, res) => {
  const token = signToken(user._id);
  if (process.env.NODE_ENV == 'production') cookieOptions.secure = true;

  user.password = undefined;
  res.status(statusCode).json({
    status: 'success',
    jwt: {
      token,
      expiresIn: process.env.JWT_EXPIRES_IN,
    },
    data: {
      user,
    },
  });
};

module.exports = {
  signUp,
  getUser,
  getSingleUser,
  login,
  logout,
  getMyProfile,
  updateProfile,
};
