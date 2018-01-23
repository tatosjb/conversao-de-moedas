$(document).ready ->
  listOfQueries = [{}]
  listOfQueries = []

  cancelAll = () ->
    listOfQueries.forEach((element) -> element.abort())
    listOfQueries = []


  $('#currency').change ->
    $('#exchange_form').submit()

  $('#currency_destination').change ->
    $('#exchange_form').submit()

  $('#quantity').keyup ->
    $('#exchange_form').submit()

  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      cancelAll();
      query = $.ajax '/exchange',
        type: 'POST'
        dataType: 'json'
        data: {
          currency: $("#currency").val(),
          currency_destination: $("#currency_destination").val(),
          quantity: $("#quantity").val()
        }
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)

      listOfQueries.push(query)
      return false;