'use strict';

// Importing functions from the controller
const {
  getAllNurses,
  getAllDoctors,
  getAllWardMonitors,
} = require('../controllers/userController');
const { protect, restrictTo } = require('../middlewares/protect');

// Importing the express router
const userRouter = require('express').Router();

// Setting up the routes
userRouter
  .route('/nurses')
  .get(
    protect,
    restrictTo('admin', 'ward-monitor', 'doctor', 'nurse'),
    getAllNurses,
  );
userRouter
  .route('/doctors')
  .get(
    protect,
    restrictTo('admin', 'ward-monitor', 'doctor', 'nurse'),
    getAllDoctors,
  );
userRouter
  .route('/ward-monitors')
  .get(protect, restrictTo('admin'), getAllWardMonitors);

module.exports = userRouter;
