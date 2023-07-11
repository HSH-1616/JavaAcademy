$(window).ready(function () {
  $(".btn").css("background-color", "transparent");
});

AOS.init();

$(window).scroll(function () {
  var scroll = $(window).scrollTop();
  var height = $(".navbar").height();
  if (scroll > height) {
    $(".navbar").addClass("drop");
  } else {
    $(".navbar").removeClass("drop");
  }
});

$(".main-menu").mouseover(function () {
  $(".navbar").addClass("drop");
});

$(".main-menu").mouseout(function () {
  var scroll = $(window).scrollTop();
  var height = $(".navbar").height();
  if (scroll < height) {
    $(".navbar").removeClass("drop");
  }
});
