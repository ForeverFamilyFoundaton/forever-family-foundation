$(function () {
    'use strict';
    function split( val ) {
          return val.split(/@/);
      }
      function extractLast( term ) {
          return split(term).pop();
      }
      function addToInput(context, term) {
          var terms = split(context.value);
          terms.pop();
          terms.push(term);
          context.value = terms.join('@');
          return false;
      }
      function tabComplete(context, event) {
              if (event.keyCode === $.ui.keyCode.TAB && $(context).data("autocomplete").menu.element.length > 0) {
                  event.preventDefault();
                  addToInput(context, $(context).data("autocomplete").menu.element[0].textContent);
                  $('.ui-autocomplete').hide();
              }
          }
      function searchOnDelimeter(request, response, data){
          var re = $.ui.autocomplete.escapeRegex(extractLast(request.term));
          var matcher = new RegExp("^" + re, "i");
          var a = $.grep(data, function(item,index){
            return matcher.test(item);
          });
          response(a)
        }
        function beforeSearch(context) {
                  var term = extractLast(context.value);
                  if ( context.value == term || term.length < 1 ) {
                      return false;
                  }
        }

    $.ajax({
        url: '/users/schema',
        dataType: 'json'
    }).done(function (data) {
      $('#email_template_body')
      .bind( "keydown", function(event) { tabComplete(this, event); })
      .autocomplete({
        source: function(request, response) { searchOnDelimeter(request, response, data); },
        focus: function() { return false; },
        search: function() { return beforeSearch(this); },
        position: 'center top',
        select: function(event, ui) { addToInput(this, ui.item.value); }
      });
      $('#email_template_title')
      .bind( "keydown", function(event) { tabComplete(this, event); })
      .autocomplete({
        source: function(request, response) { searchOnDelimeter(request, response, data); },
        focus: function() { return false; },
        search: function() { return beforeSearch(this); },
        position: 'center top',
        select: function(event, ui) { addToInput(this, ui.item.value); }
      });
    });
});
