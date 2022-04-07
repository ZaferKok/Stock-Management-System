"use strict";

const Sequelize = require('sequelize');

const sequelize = new Sequelize('Stock_Management', 'root', '', { // DATABASE CONNECTION
    host: 'localhost',
    dialect: 'mysql'
}); 

module.exports = sequelize;