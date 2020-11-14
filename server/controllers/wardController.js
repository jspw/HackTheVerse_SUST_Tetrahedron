'use strict';

const WardModel = require('../models/WardModel');
const AppError = require('../utils/appError');
const catchAsync = require('../utils/catchAsync');

const getWards = catchAsync(async (req, res, next) => {
  const wards = await WardModel.find({ hospital: req.user.hospital });

  res.status(200).json({
    status: 'success',
    data: { wards },
  });
});

const createWard = catchAsync(async (req, res, next) => {
  const { name, bedCount } = req.body;
  const hospital = req.user.hospital;

  const newWard = new WardModel({ name, bedCount, hospital });
  const ward = await newWard.save();

  res.status(200).json({
    status: 'success',
    data: { ward },
  });
});

module.exports = { getWards, createWard };
