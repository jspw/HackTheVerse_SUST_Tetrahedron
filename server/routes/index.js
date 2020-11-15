('use strict');

// Importing the app error class
const AppError = require('../utils/appError');

// Importing the routers
const adminRouter = require('./adminRoutes');
const patientRouter = require('./patientRoutes');
const userRouter = require('./userRoutes');
const wardRouter = require('./wardRoutes');

// Importing express router
const router = require('express').Router();

// Registering all routers
router.use('/admin', adminRouter);
router.use('/users', userRouter);
router.use('/wards', wardRouter);
router.use('/patients', patientRouter);

// The 404 route
router.all('*', (req, res, next) => next(new AppError('Not found', 404)));

module.exports = router;
