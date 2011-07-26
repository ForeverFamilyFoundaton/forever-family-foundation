$(function($){//on document ready
  // External links
  // Creating custom :external selector
  $.expr[':'].external = function(obj){
      return !obj.href.match(/^mailto\:/)
              && (obj.hostname.replace(/:3000|:3001/,'') != location.hostname);
  };  
  $.expr[':'].external_img = function(obj){
    return !obj.href.match(/^mailto\:/) && !$(obj).attr('src') != 'ndefinded' && (obj.hostname.replace(/:3000|:3001/,'') != location.hostname);
  };

  // Add 'external' CSS class to all external links
  $('a:external').addClass('external');
  // $('a:external_img').addClass('external_img');
  $('a:external, a:external_img').click(function(){
    window.open(this.href);
    return false;
  });
});

