const Sequelize = require('sequelize');
const sequelize = require('./connection'); // Database Connection

let Client = sequelize.define("Clients", { // Create Table
   
    username: {
        type: Sequelize.STRING,
        allowNull: false
    },

    password: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

module.exports = Client;