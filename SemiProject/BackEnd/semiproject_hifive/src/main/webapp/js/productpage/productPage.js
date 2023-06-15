//댓글창
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

  const price = $("#productPrice")
    .html()
    .toString()
    .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  $("#productPrice").html(price);
});
//*댓글창*//
