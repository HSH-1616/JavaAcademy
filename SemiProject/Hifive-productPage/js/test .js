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
