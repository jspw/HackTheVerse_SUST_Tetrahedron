'use strict';

// Importing mongoose and Schema
const mongoose = require('mongoose');
const validator = require('validator');
const Schema = mongoose.Schema;

// Creating a schema
const appointmentSchema = new Schema({
  disease: {
    type: String,
    required: [true, 'Disease is required'],
  },
  date: {
    type: Date,
    required: [true, 'Date is required'],
  },
  doctor: {
    type: Schema.Types.ObjectId,
    ref: 'User',
    required: [true, 'DoctorID is required'],
  },
  patient: {
    type: Schema.Types.ObjectId,
    ref: 'User',
  },
  chamber: {
    type: Schema.Types.ObjectId,
    ref: 'Chamber',
    required: [true, 'ChamberID is required'],
  },
  note: {
    type: String,
  },
});

// Creating model from a Schema
const AppointmentModel = mongoose.model('Appointment', appointmentSchema);

module.exports = AppointmentModel;
