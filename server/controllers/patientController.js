'use strict';

const PatientModel = require('../models/PatientModel');
const WardModel = require('../models/WardModel');
const AppError = require('../utils/appError');
const catchAsync = require('../utils/catchAsync');

const getPatients = catchAsync(async (req, res, next) => {
  const { hospital, ward } = req.user;
  const patients = await PatientModel.find({ hospital, ward });

  res.status(200).json({
    status: 'success',
    data: { patients },
  });
});

const createPatient = catchAsync(async (req, res, next) => {
  const { hospital, ward } = req.user;
  const { name, age, disease, bed, note } = req.body;

  const patientInBed = await PatientModel.find({
    hospital,
    ward,
    released: false,
    bed,
  });

  if (patientInBed.length > 0)
    return next(new AppError("There's a patient in that bed", 400));

  const newPatient = new PatientModel({
    name,
    age,
    disease,
    hospital,
    ward,
    bed,
    note,
  });
  const patient = await newPatient.save();

  res.status(200).json({
    status: 'success',
    data: { patient },
  });
});

const getSinglePatient = catchAsync(async (req, res, next) => {
  const { hospital, ward } = req.user;
  const patient = await PatientModel.findOne({
    _id: req.params.id,
    hospital,
    ward,
  });
  if (!patient)
    return next(
      new AppError('The patient is not found in your hospital.', 404),
    );

  res.status(200).json({
    status: 'success',
    data: { patient },
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

module.exports = { getPatients, createPatient, getSinglePatient };
