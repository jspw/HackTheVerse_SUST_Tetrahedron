'use strict';

// Importing mongoose and Schema
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Creating a schema
const patientSchema = new Schema({
  name: {
    type: String,
    required: [true, 'Name of the patient is required'],
  },
  age: {
    type: Number,
    required: [true, 'Age of the patient is required'],
  },
  disease: {
    type: String,
    required: [true, 'Disease of the patient is required'],
  },
  note: {
    type: String,
  },
  medics: [
    {
      name: {
        type: String,
        required: [true, 'Name of the medicine is required'],
      },
      frequency: {
        type: [Number],
        required: [true, 'Frequency of the medicine is required'],
        validate: {
          validator: freq => freq.length == 3,
          message: 'Please give a array of 3 number for frequency',
        },
      },
      note: {
        type: String,
      },
    },
  ],
  hospital: {
    type: Schema.Types.ObjectId,
    ref: 'Hospital',
  },
  ward: {
    type: Schema.Types.ObjectId,
    ref: 'Ward',
  },
  bed: {
    type: String,
    required: [true, 'Bed no of the patient is required'],
  },
  admitDate: {
    type: Date,
    default: Date.now(),
  },
  releaseDate: {
    type: Date,
  },
});

// Creating model from a Schema
const PatientModel = mongoose.model('Patient', patientSchema);

module.exports = PatientModel;
