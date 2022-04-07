"use strict";

{
    const addName = document.querySelector('#addName');
    const addQuantity = document.querySelector('#addQuantity');
    const addPrice = document.querySelector('#addPrice');
    const addType = document.querySelector('#addType');

    document.querySelector('.btn.btn-outline-dark.fw-bold').addEventListener('click', successfullyAdding);

    function successfullyAdding() {
        if (addName.value && addQuantity.value && addPrice.value && addType.value) {
            alert("YOUR INPUT SUCCESSFULL ADDED!");
        } else if (!addName.value) {
            alert("PLEASE ENTER THE PRODUCT NAME!");
        } else if (!addQuantity.value) {
            alert("PLEASE ENTER THE PRODUCT QUANTITY!");
        } else if (!addPrice.value) {
            alert("PLEASE ENTER THE PRODUCT PRICE!");
        } else if (!addType.value) {
            alert("PLEASE SELECT THE PRODUCT TYPE!");
        }
    }
}