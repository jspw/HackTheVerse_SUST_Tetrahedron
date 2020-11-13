'use strict';

const ChamberModel = require('../models/ChamberModel');
const AppError = require('../utils/appError');
const catchAsync = require('../utils/catchAsync');

const getChambers = catchAsync(async (req, res, next) => {
  const chambers = await ChamberModel.find();

  res.status(200).json({
    status: 'success',
    data: { chambers },
  });
});

const createChamber = catchAsync(async (req, res, next) => {
  const { name, city, contact, weekdays } = req.body;
  const doctor = req.user._id;

  const newChamber = new ChamberModel({
    name,
    city: city.toLowerCase(),
    contact,
    weekdays,
    doctor,
  });
  const chamber = await newChamber.save();

  res.status(200).json({
    status: 'success',
    data: { chamber },
  });
});

const getChambersByCity = catchAsync(async (req, res, next) => {
  const city = req.params.city;
  const chambers = await ChamberModel.find({ city: city.toLowerCase() });

  res.status(200).json({
    status: 'success',
    data: { chambers },
  });
});

module.exports = { getChambers, createChamber, getChambersByCity };
