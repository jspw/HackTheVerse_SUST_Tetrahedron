'use strict';

// Importing functions from the controller
const {
  register,
  login,
  createUser,
} = require('../controllers/adminController');
const { protect, restrictTo } = require('../middlewares/protect');

// Importing the express router
const adminRouter = require('express').Router();

// Setting up the routes
adminRouter.route('/register').post(register);
adminRouter.route('/login').post(login);
adminRouter.route('/createuser').post(protect, restrictTo('admin'), createUser);

module.exports = adminRouter;
