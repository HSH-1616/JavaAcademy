$(window).scroll(function () {
  var scroll = $(window).scrollTop();
  var height = $(".navbar").height();
  if (scroll > height) {
    $(".navbar").addClass("drop");
  } else {
    $(".navbar").removeClass("drop");
  }
});

$(window).ready(function () {
  $(".btn").css("background-color", "transparent");
});
