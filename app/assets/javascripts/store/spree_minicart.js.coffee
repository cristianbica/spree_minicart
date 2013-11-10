#= require store/jquery.hoverintent

window.Spree or= {}
window.Spree or= {}

class Spree.MiniCart
  constructor: ->
    @setupDom()
    @attachEvent()
    @loadCart()


  setupDom: ->
    $("#link-to-cart").append($("<div>").attr("id","minicart"))
    $("#wrapper").append($("<div>").attr("id", "progress").html("Loading ..."))

  attachEvent: ->
    config =
      over: ->
        $("#minicart").slideDown()

      timeout: 250 # number = milliseconds delay before onMouseOut
      out: ->
        $("#minicart").slideUp()
    $("#link-to-cart").hoverIntent config


    $(document).on "click", "form#update-minicart a.delete", (e) ->
      $(this).parent().siblings("div[data-hook=\"minicart_item_quantity\"]").find("input.line_item_quantity").val 0
      $(this).parents("form").first().submit()
      e.preventDefault()

    $(document).on "ajax:beforeSend", "form[data-remote]", ->
      $("#progress").slideDown()

    $(document).on "ajax:complete", "form[data-remote]", ->
      $("#progress").slideUp()

  loadCart: ->
    $.get "/minicart.js"

$ ->
  $(document).ready ->
    new Spree.MiniCart


