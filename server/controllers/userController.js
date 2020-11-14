'use strict';

// Importing the model
const AppError = require('../utils/appError');
const catchAsync = require('../utils/catchAsync');
const UserModel = require('../models/UserModel');

// Function to get all nurses
const getAllNurses = catchAsync(async (req, res, next) => {
  const { hospital } = req.user;
  let nurses;
  if (req.user.role === 'admin')
    nurses = await UserModel.find({ hospital, role: 'nurse' });
  else if (req.user.role === 'ward-monitor')
    nurses = await UserModel.find({
      hospital,
      ward: req.user.ward,
      role: 'nurse',
    });

  res.status(200).json({
    status: 'success',
    data: { nurses },
  });
});

const getAllDoctors = catchAsync(async (req, res, next) => {
  const { hospital } = req.user;
  let doctors;
  if (req.user.role === 'admin')
    doctors = await UserModel.find({ hospital, role: 'doctor' });
  else if (req.user.role === 'ward-monitor')
    doctors = await UserModel.find({
      hospital,
      ward: req.user.ward,
      role: 'doctor',
    });

  res.status(200).json({
    status: 'success',
    data: { doctors },
  });
});

const getAllWardMonitors = catchAsync(async (req, res, next) => {
  const { hospital } = req.user;
  const wardMonitors = await UserModel.find({ hospital, role: 'ward-monitor' });

  res.status(200).json({
    status: 'success',
    data: { wardMonitors },
  });
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

module.exports = { getAllNurses, getAllDoctors, getAllWardMonitors };
