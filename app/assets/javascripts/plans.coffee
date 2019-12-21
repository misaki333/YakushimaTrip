$(document).on 'change', '#plan_destinations_attributes_0_category', ->
  $.ajax(
    type: 'GET'
    url: '/destinations/spots_select'
    data: {
      category_id: $(this).val()
    }
  ).done (data) ->
    $('#destination_spot').html(data)