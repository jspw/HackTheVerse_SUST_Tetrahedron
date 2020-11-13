'use strict';

// Importing functions from the controller
const {
  getChambers,
  createChamber,
  getChambersByCity,
} = require('../controllers/chamberController');
const { protect, restrictTo } = require('../middlewares/protect');

// Importing the express router
const chamberRouter = require('express').Router();

// Setting up the routes
chamberRouter
  .route('/')
  .get(protect, getChambers)
  .post(protect, restrictTo('doctor'), createChamber);
chamberRouter.route('/city/:city').get(protect, getChambersByCity);

module.exports = chamberRouter;
