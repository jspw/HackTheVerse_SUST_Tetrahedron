'use strict';

// Importing mongoose and Schema
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Creating a schema
const chamberSchema = new Schema({
  name: {
    type: String,
    required: [true, 'A chamber should have a name'],
  },
  city: {
    type: String,
    required: [true, 'A chamber must be in a city'],
  },
  contact: {
    type: String,
    required: [true, 'A chamber should have a contact number'],
  },
  weekdays: {
    type: [Boolean],
    default: [1, 1, 1, 1, 1, 1, 1],
    validate: {
      validator: days => days.length == 7,
      message: 'Please give a array of 7 booleans for weekdays',
    },
  },
  doctor: {
    type: Schema.Types.ObjectId,
    ref: 'User',
  },
});

// Creating model from a Schema
const ChamberModel = mongoose.model('Chamber', chamberSchema);

module.exports = ChamberModel;
