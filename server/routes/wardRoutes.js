'use strict';

const {
  getWards,
  createWard,
  updateWard,
  getSingleWard,
} = require('../controllers/wardController');
// Importing functions from the controller
const { protect, restrictTo } = require('../middlewares/protect');

// Importing the express router
const wardRouter = require('express').Router();

// Setting up the routes
wardRouter
  .route('/')
  .get(protect, restrictTo('admin'), getWards)
  .post(protect, restrictTo('admin'), createWard);
wardRouter
  .route('/:id')
  .get(protect, restrictTo('admin'), getSingleWard)
  .put(protect, restrictTo('admin'), updateWard);

module.exports = wardRouter;
