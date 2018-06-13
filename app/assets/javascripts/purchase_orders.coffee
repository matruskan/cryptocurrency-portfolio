# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@updatePrice = ->
    quantityValue = document.getElementById('quantity-field').value;
    quantity = quantityValue ? 0.0 : parseFloat(quantityValue)
    price = parseFloat(document.getElementById('price').innerHTML)
    document.getElementById('quantity').innerHTML = quantity
    document.getElementById('total').innerHTML = (quantity*price)
