'use strict';

// Importing mongoose and Schema
const mongoose = require('mongoose');
const validator = require('validator');
const bcrypt = require('bcryptjs');
const Schema = mongoose.Schema;

// Creating a schema
const userSchema = new Schema({
  name: {
    type: String,
    required: [true, 'Name is required'],
  },
  username: {
    type: String,
    required: [true, 'Please give a username'],
    unique: true,
    minlength: 3,
  },
  email: {
    type: String,
    validate: {
      validator: validator.isEmail,
      message: 'This is not a valid email',
    },
    lowercase: true,
  },
  phone: {
    type: String,
  },
  hospital: {
    type: Schema.Types.ObjectId,
    ref: 'Hospital',
  },
  password: {
    type: String,
    required: [true, 'Password is required'],
    select: false,
  },
  registered_at: {
    type: Date,
    default: Date.now,
  },
  password_changed_at: {
    type: Date,
  },
  role: {
    type: String,
    enum: ['admin', 'doctor', 'nurse', 'ward-monitor'],
    required: [true, 'A user must have a role'],
  },
  ward: {
    type: Schema.Types.ObjectId,
    ref: 'Ward',
  },
});

// Encrypt the password
userSchema.pre('save', async function (next) {
  // To run encryption only if the password is changed
  if (!this.isModified('password')) return next();

  // Hash the password with the cost of 12
  this.password = await bcrypt.hash(this.password, 12);
  next();
});

// Check if the user changed password after jwt timestamp
userSchema.methods.changedPasswordAfter = function (JWTTimestamp) {
  if (this.password_changed_at) {
    const timestamp = parseInt(this.password_changed_at.getTime() / 1000, 10);
    return JWTTimestamp < timestamp;
  }

  return false;
};

// Creating model from a Schema
const UserModel = mongoose.model('User', userSchema);

module.exports = UserModel;
