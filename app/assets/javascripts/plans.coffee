$(document).on 'change', '#destination_category', ->
  $.ajax(
    type: 'GET'
    url: '/plans/spots_select'
    data: {
      category_id: $(this).val()
    }
  ).done (data) ->
    $('#destination_spot').html(data)