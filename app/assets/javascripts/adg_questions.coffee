$ ->
  $('table.adg_questions input:radio.yes').click ->
    console.log 'aoeu'
    $(this).siblings('div.ansewer_field').show()

  $('table.adg_questions input:radio.no').click ->
    $(this).siblings('div.ansewer_field').hide()
