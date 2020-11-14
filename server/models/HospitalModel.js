'use strict';

// Importing mongoose and Schema
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Creating a schema
const hospitalSchema = new Schema({
  name: {
    type: String,
    required: [true, 'Name of the hospital is required'],
  },
  address: {
    type: String,
    required: [true, 'Address of the hospital is required'],
  },
  verified: {
    type: Boolean,
    default: false,
  },
  verificationDataURL: {
    type: String,
    required: [true, 'Please provide a document to verify the hospital'],
    select: false,
  },
});

// Creating model from a Schema
const HospitalModel = mongoose.model('Hospital', hospitalSchema);

module.exports = HospitalModel;
