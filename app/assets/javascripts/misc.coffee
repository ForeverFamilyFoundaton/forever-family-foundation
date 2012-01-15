$ ->
  $('a.popup').click ->
    window.new @.attr('href')
    return false