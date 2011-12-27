$ ->
  $('table.adg_questions input:radio.yes').click( -> $(this).siblings('div.ansewer_field').show() )
  $('table.adg_questions input:radio.no').click( -> $(this).siblings('div.ansewer_field').hide() )  