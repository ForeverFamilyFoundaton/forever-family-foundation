$(function() {
  $(".toggle-password").click(function() {
    $(this).toggleClass("fa-eye fa-eye-slash");

    var input = $($(this).data("toggle"));

    if (input.attr("type") == "password") {
      input.attr("type", "text");
    } else {
      input.attr("type", "password");
    }

  });
});
