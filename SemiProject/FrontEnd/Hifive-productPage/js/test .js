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
    .css({ "background-color": "white", color: "#afafaf" });
  console.log(this);
  $(this).css({ "background-color": "#20c997", color: "white" });
  $("#sideMenu-" + id).css("display", "block");
});
$("#category0").mouseleave(function () {
  $("#menuList a").css({ "background-color": "white", color: "#afafaf" });
});
$(".sideMenu").mouseleave(function () {
  $(".sideMenu").css("display", "none");
  $("#menuList a").css({ "background-color": "white", color: "#afafaf" });
});
$("section").mouseenter(function () {
  $(".sideMenu").css("display", "none");
  $("#menuList a").css({ "background-color": "white", color: "#afafaf" });
});
$("section").click(function (e) {
  if ($("#menuIcon").is(":checked")) {
    $("#menuIcon").prop("checked", false);
  }
});

// /상단메뉴바/
$(() => {
  $("#cmtText").keyup(contentInput).keydown(contentInput);
});

function contentInput(e) {
  const length = $(e.target).val().length;
  if (length > 100) {
    alert("100글자이하로 작성하세요!");
    $(e.target).val($(e.target).val().substring(0, 100));
  }
  $(e.target)
    .next()
    .text(`${$(e.target).val().length}/100`);
  if (length == 0) {
    $("#textContainer span").css("color", "#afafaf");
    $("#cmtBtn").css({ color: "#afafaf", "background-color": "#eeeeee" });
  } else if (length >= 1) {
    $("#textContainer span").css("color", "#20c997");
    $("#cmtBtn").css({ color: "white", "background-color": "#20c997" });
  }
}

$(document).ready(function () {
  $("#textContainer").on("keyup", "textarea", function (e) {
    $(this).css("height", "auto");
    $(this).height(this.scrollHeight);
  });
  $("#textContainer").find("textarea").keyup();
});
