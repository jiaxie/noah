$(function(){
  hide_and_bundle();
});

var hide_and_bundle = function(){
  $(".time-line").hide();

  $(".mouse-detector").hover(function(){
    $(".time-line").show();
  })

  $(".time-line").bind('mouseout',function(){
    $(".time-line").hide();
  })
}

