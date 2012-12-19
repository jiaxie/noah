$(function(){
  hide_and_bundle();
});

var hide_and_bundle = function(){
  $(".time-panel").css('height','20');
  $(".time-panel").hover(function(){
    $(".time-panel").css('height','80');
  })
  $(".time-panel").bind('mouseout',function(){
    $(".time-panel").css('height','20');
  })
}

