'use strict';

// Importing functions from the controller
const {
  getPatients,
  createPatient,
  getSinglePatient,
} = require('../controllers/patientController');
const { protect, restrictTo } = require('../middlewares/protect');

// Importing the express router
const patientRouter = require('express').Router();

// Setting up the routes
patientRouter
  .route('/')
  .get(protect, restrictTo('doctor', 'nurse', 'ward-monitor'), getPatients)
  .post(protect, restrictTo('ward-monitor'), createPatient);
patientRouter
  .route('/:id')
  .get(
    protect,
    restrictTo('doctor', 'nurse', 'ward-monitor'),
    getSinglePatient,
  );

module.exports = patientRouter;
