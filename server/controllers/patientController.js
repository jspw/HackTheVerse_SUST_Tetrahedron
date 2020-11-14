'use strict';

const PatientModel = require('../models/PatientModel');
const WardModel = require('../models/WardModel');
const AppError = require('../utils/appError');
const catchAsync = require('../utils/catchAsync');
const redis = require('redis');
const { promisify } = require('util');
const sensors = require('../dataGenerator/sensors');

const client = redis.createClient();
const lrangeAsync = promisify(client.lrange).bind(client);

const getPatients = catchAsync(async (req, res, next) => {
  const { hospital, ward } = req.user;
  const patients = await PatientModel.find({ hospital, ward }).lean();

  // const patientWithStat = patients.map(patient => {
  //   const sensorData = [];
  //   sensors.map(async ({ name }) => {
  //     const key = `${_id}:${name}:minute`;
  //     const value = (await lrangeAsync(key, '0', '0'))[0];

  //     sensorData.push({ name, value });
  //   });
  //   return { ...patient, sensorData };
  // });

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

module.exports = { getPatients, createPatient, getSinglePatient };
