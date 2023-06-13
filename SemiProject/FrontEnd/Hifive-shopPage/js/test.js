// 검색기능 (ex구글)
function searchData() {
  let keyword = document.getElementsByClassName("search")[0].value;
  location.href = "https://www.google.co.kr/search?q=" + keyword;
  console.log(keyword);
}
// /검색기능/

// 상단메뉴바

$("#menuList a").mouseenter(function () {
  const id = $(this).attr("id");
  $(".sideMenu")
    .not($("#sideMenu-" + id))
    .css("display", "none");
  $("#menuList a")
    .not($(this))
    .css({"background-color": "white", color: "#afafaf"});
  console.log(this);
  $(this).css({"background-color": "#20c997", color: "white"});
  $("#sideMenu-" + id).css("display", "block");
});
$("#category0").mouseleave(function () {
  $("#menuList a").css({"background-color": "white", color: "#afafaf"});
});
$(".sideMenu").mouseleave(function () {
  $(".sideMenu").css("display", "none");
  $("#menuList a").css({"background-color": "white", color: "#afafaf"});
});
$("section").mouseenter(function () {
  $(".sideMenu").css("display", "none");
  $("#menuList a").css({"background-color": "white", color: "#afafaf"});
});
$("section").click(function (e) {
  if ($("#menuIcon").is(":checked")) {
    $("#menuIcon").prop("checked", false);
  }
});

// /상단메뉴바/

// 카테고리 사이드바

$(".collapse").on("show.bs.collapse", function () {
  var target = $("[href='#" + $(this).prop("id") + "']");
  target.removeClass("fa-plus-square");
  target.addClass("fa-minus-square");
});
$(".collapse").on("shown.bs.collapse", function () {
  var target = $("[href='#" + $(this).prop("id") + "']");
  target.removeClass("fa-plus-square");
  target.addClass("fa-minus-square");
});
$(".collapse").on("hide.bs.collapse", function () {
  var target = $("[href='#" + $(this).prop("id") + "']");
  target.removeClass("fa-minus-square");
  target.addClass("fa-plus-square");
});
$(".collapse").on("hidden.bs.collapse", function () {
  var target = $("[href='#" + $(this).prop("id") + "']");
  target.removeClass("fa-minus-square");
  target.addClass("fa-plus-square");
});
// /카테고리 사이드바/

$(".radio-input input").on("change", function () {
  // const input = $(".radio-input input").val();
  const input = $("input[name='value-radio']:checked").val();
  if (input == "value-1") {
    $("#shopProductContainer").css("display", "block");
    $("#reviewContainer").css("display", "none");
  } else if (input == "value-2") {
    $("#shopProductContainer").css("display", "none");
    $("#reviewContainer").css("display", "block");
  }
});
