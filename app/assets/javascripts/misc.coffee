$ ->
  $('a.popup').popupWindow
    height:700
    width:1000
    top:50
    left:50

  $('a.close').click ->
    alert 'aeu'
    window.close()
