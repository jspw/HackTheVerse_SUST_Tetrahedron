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

const getSingleWard = catchAsync(async (req, res, next) => {
  const hospital = req.user.hospital;
  const ward = await WardModel.findOne({ _id: req.params.id, hospital });
  if (!ward)
    return next(new AppError('The ward is not found in your hospital.', 404));

  res.status(200).json({
    status: 'success',
    data: { ward },
  });
});

const updateWard = catchAsync(async (req, res, next) => {
  const hospital = req.user.hospital;
  const selectedWard = await WardModel.findOne({
    _id: req.params.id,
    hospital,
  });
  if (!selectedWard)
    return next(new AppError('The ward is not found in your hospital.', 404));
  const name = req.body.name || selectedWard.name;
  const bedCount = req.body.bedCount || selectedWard.bedCount;
  const ward = await WardModel.findByIdAndUpdate(
    req.params.id,
    {
      name,
      bedCount,
    },
    { new: true },
  );

  res.status(200).json({
    status: 'success',
    data: { ward },
  });
});

module.exports = { getWards, createWard, updateWard, getSingleWard };
