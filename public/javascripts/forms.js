$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});


jQuery.fn.while_submit = function() {
  this.click(function() {
    // hide the submit button and show the progess spinner
    $(this).hide();
    $('.progress_spinner').show();
  })
  return this;
};

$(function($){//on document ready
  // hide by default just in case the css didn't catch it
  $('.progress_spinner').hide('fast');

  $(".submit").each(function (i) {
    $(this).while_submit();
  });
});

