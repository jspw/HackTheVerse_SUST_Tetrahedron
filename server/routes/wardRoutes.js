'use strict';

const { getWards, createWard } = require('../controllers/wardController');
// Importing functions from the controller
const { protect, restrictTo } = require('../middlewares/protect');

// Importing the express router
const wardRouter = require('express').Router();

// Setting up the routes
wardRouter
  .route('/')
  .get(protect, restrictTo('admin'), getWards)
  .post(protect, restrictTo('admin'), createWard);

module.exports = wardRouter;
