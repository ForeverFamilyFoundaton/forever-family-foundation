jQuery(document).ready(function($) {
  $('.hide').click(function(event) {
    var created_at = $(event.target).data('created-at');
    hideAnnouncement(created_at);
  });
});

function hideAnnouncement(announcement_created_at) {
  createCookie(announcement_created_at, 'hidden', 365);
  $(".announcement").slideUp();
  $("#layout").animate({paddingTop: "0px"});
  $("#layout").removeClass('bar');
}

// http://www.quirksmode.org/js/cookies.html
function createCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
  }
  else var expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}
