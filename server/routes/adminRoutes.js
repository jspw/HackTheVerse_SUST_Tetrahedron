'use strict';

// Importing functions from the controller
const { register } = require('../controllers/adminController');
const { protect } = require('../middlewares/protect');

// Importing the express router
const adminRouter = require('express').Router();

// Setting up the routes
adminRouter.route('/register').post(register);

module.exports = adminRouter;
