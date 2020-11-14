'use strict';

// Importing mongoose and Schema
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Creating a schema
const wardSchema = new Schema({
  name: {
    type: String,
    required: [true, 'Name of the ward is required'],
  },
  bedCount: {
    type: Number,
    min: 0,
    required: [true, 'Bed count of the ward is required'],
  },
  hospital: {
    type: Schema.Types.ObjectId,
    ref: 'Hospital',
    required: [true, 'Hospital ID of the ward is required'],
  },
});

// Creating model from a Schema
const WardModel = mongoose.model('Ward', wardSchema);

module.exports = WardModel;
