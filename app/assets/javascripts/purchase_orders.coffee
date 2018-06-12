# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@updatePrice = ->
    quantity = parseFloat(document.getElementById('quantity-field').value)
    price = parseFloat(document.getElementById('price').innerHTML)
    document.getElementById('quantity').innerHTML = quantity
    document.getElementById('total').innerHTML = (quantity*price)
