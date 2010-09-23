$(function() {
  var converter = new Showdown.converter();
  $("#command_content").keyup(function(){
    var txt = $("#command_content").val();
    var html = converter.makeHtml(txt);
    $("#result").html(html)
    $("#html_result").val(html.replace(/>/g, ">\n").replace(/</g, "\n<").replace(/\n{2,}/g, "\n\n"));
  });
});
