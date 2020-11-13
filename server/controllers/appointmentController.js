'use strict';

const AppointmentModel = require('../models/AppointmentModel');
const catchAsync = require('../utils/catchAsync');

const getAppointments = catchAsync(async (req, res, next) => {
  const appointments = await AppointmentModel.find();

  res.status(200).json({
    status: 'success',
    data: { appointments },
  });
});

const createAppointment = catchAsync(async (req, res, next) => {
  const { disease, date, doctor, chamber, note } = req.body;
  const patient = req.user._id;

  const newAppointment = new AppointmentModel({
    disease,
    date,
    doctor,
    chamber,
    note,
    patient,
  });
  const appointment = await newAppointment.save();

  res.status(200).json({
    status: 'success',
    data: { appointment },
  });
});

const getMyAppointments = catchAsync(async (req, res, next) => {
  let appointments;
  const id = req.user._id;
  if (req.user.role === 'patient')
    appointments = await AppointmentModel.find({ patient: id }).populate(
      'doctor patient chamber',
    );
  else if (req.user.role === 'doctor')
    appointments = await AppointmentModel.find({ doctor: id }).populate(
      'doctor patient chamber',
    );

  res.status(200).json({
    status: 'success',
    data: { appointments },
  });
});

const getSingleAppointment = catchAsync(async (req, res, next) => {
  const id = req.params.id;
  const appointment = await AppointmentModel.findById(id).populate(
    'doctor patient chamber',
  );

  res.status(200).json({
    status: 'success',
    data: { appointment },
  });
});

module.exports = {
  getAppointments,
  createAppointment,
  getMyAppointments,
  getSingleAppointment,
};
