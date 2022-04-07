"use strict";

const express = require("express");
const bodyParser = require("body-parser");
const APP = express();
const IP = "127.0.0.1";
const PORT = 7000;

const Equipments = require('./equipmentsTable');
const Clients = require('./clientsTable');
const sequelize = require('./connection');
const req = require("express/lib/request");
const { name } = require("ejs");


// Templating Engine
APP.set('view engine', 'ejs');

// Static Files
APP.use(express.static('public'));

// Parsing middleware
// Pares application/x-www-form-urlencoded
APP.use(bodyParser.urlencoded({ extended: true }));

// Pares application/json
APP.use(bodyParser.json());

///////////////////////////////////// DATA BASE ////////////////////////////////////
sequelize.sync().then(function () {
    console.log("Tabelle erstellt");
});
////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////// LOGIN //////////////////////////////////////
APP.get('/login', (request, response) => {
    console.log("LOGIN");
    response.render('login');
});

APP.post('/login', (request, response) => {
    console.log("LOGIN_SUBMIT");

    Clients.findOne({
        raw: true,
        attributes: ["username", "password"],
        where: {
            username: request.body.username,
            password: request.body.password
        }
    })
        .then(function (obj) {
            if (obj) {
                Equipments.findAll({
                    raw: true,
                    attributes: ["id", "name", "quantity", "price", "type"],
                })
                    .then(function (equipments) {
                        response.render("home", { products: equipments });
                    })
            }else {
                response.redirect("/login");
            }
        })
});
////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////// LOGOUT //////////////////////////////////////
APP.get('/logout', (request, response) => {
    console.log("LOGOUT");
    response.render('login');
});
////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////// HOME PAGE ////////////////////////////////////
APP.get('/', (request, response) => {
    console.log("HOME");
    Equipments.findAll({
        //limit: 5,
        raw: true,
        attributes: ["id", "name", "quantity", "price", "type"],
        // where: {spalte: Wert}
    })
        .then(function (obj) {
            response.render("home", { products: obj });
        })
});
////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////// ADD PAGE  ///////////////////////////////////

APP.get('/add', (request, response) => {
    console.log("ADD");
    response.render('add');
});

////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////// MAIN PAGE  ///////////////////////////////////
APP.get('/main', (request, response) => {
    console.log("Stock Management System");
    response.render('product');
});
////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////// ADD MANUAL //////////////////////////////////
// Equipments.create({
//     name: "Keyboard",
//     quantity: 99,
//     price: 19.99,
//     type: "ram"
// });
////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////// VIEW PRODUCT //////////////////////////////////
APP.get('/view/:id', (request, response) => {
    console.log("VIEW");
    Equipments.findAll({
        raw: true,
        attributes: ["id", "name", "quantity", "price", "type", "details"],
        where: { id: request.params.id }
    })
        .then(function (obj) {
            console.log(obj);
            response.render("view", { products: obj });
        })

});
////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////// EDIT PRODUCT ////////////////////////////////////
APP.get('/edit/:id', (request, response) => {
    console.log("EDIT FIND");
    Equipments.findAll({
        raw: true,
        attributes: ["id", "name", "quantity", "price", "type", "details"],
        where: { id: request.params.id }
    })
        .then(function (obj) {
            // console.log(obj);
            response.render("edit", { products: obj });
        })

});
APP.post('/editProduct/:id', (request, response) => {
    console.log("EDIT OK");
    Equipments.update({
        ...request.body
        // name:       request.body.name,
        // quantity:   request.body.quantity,
        // price:      request.body.price
    }, {
        where: { id: request.params.id }
    })//.then(()=>{
    response.redirect('/');
    //  })
})
/////////////////////////////////////////////////////////////////////////////////////


//////////////////////////// ADD NEW PRODUCT (POST) /////////////////////////////////

APP.post('/addProduct', (request, response) => {
    console.log("POST");
    Equipments.create({
        ...request.body
        // name: request.body.name,
        // quantity: request.body.quantity,
        // price: request.body.price,
        // type: request.body.type,
    }).then(() => {
        response.redirect('/add');
    })
})
/////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////// DELETE PRODUCT ///////////////////////////////////
APP.post('/deleteProduct/:id', (request, response) => {
    console.log("DELETE");
    Equipments.destroy({
        where: { id: request.params.id }
    });
    response.redirect('/');
});
/////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////// SEARCH  ///////////////////////////////////////
APP.get('/search', (request, response) => {
    console.log("HOME SEARCH");
    console.log(request.query.searchBox);
    Equipments.findAll({
        raw: true,
        attributes: ["id", "name", "quantity", "price", "type", "details"],
        where: {
            //name: request.query.searchBox
            name: sequelize.where(sequelize.fn('LOWER', sequelize.col('name')),
                'LIKE', '%' + request.query.searchBox.toLowerCase() + '%')
        }
    })
        .then(function (obj) {
            console.log(obj);
            response.render("home", { products: obj });
        })
});
/////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////// DROPDOWN  //////////////////////////////////////
let dropdownList = ['ram', 'drive', 'screen', 'nvidia', 'cpu', 'asus', 'headset', 'keyboard', 'webcam', ''];

dropdownList.forEach((drop) => {
    APP.get('/' + drop, (request, response) => {
        console.log("HOME SEARCH");
        console.log(request.query.searchBox);
        Equipments.findAll({
            raw: true,
            attributes: ["id", "name", "quantity", "price", "type", "details"],
            where: {
                type: sequelize.where(sequelize.fn('LOWER', sequelize.col('name')), 'LIKE', '%' + drop + '%'),
            }
        })
            .then(function (obj) {
                console.log(obj);
                response.render("home", { products: obj });
            })
    });
});
/////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////// SERVER LISTEN ////////////////////////////////////
APP.listen(PORT, IP, () => {
    console.log(`http://${IP}:${PORT}/login`)
});
/////////////////////////////////////////////////////////////////////////////////////