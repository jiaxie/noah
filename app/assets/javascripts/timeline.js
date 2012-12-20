$(function(){
  hide_and_bundle();
  scroll_magic();
});

$(window).scroll(function(){ 
  markElephant();
});

var hide_and_bundle = function(){
  $(".horizon-timeline").hide();

  // $(".mouse-detector").hover(function(){
  //   $(".time-line").show();
  // })

  // $(".time-line").bind('mouseout',function(){
  //   $(".time-line").hide();
  // })
}

var scroll_magic = function(){
  $(".blog-item").each(function(){
    $(this).addClass("rat");
  })

  $(".blog-item :first").removeClass("rat");
  $(".blog-item :first").addClass("elephant");
}

var markElephant = function(){
  var minDistance;
  var nearest = null;
  var winHeight;

  if (window.innerHeight){
    winHeight = window.innerHeight;
  }
  else if((document.body) && (document.body.clientHeight)){
    winHeight = document.body.clientHeight;
  }

  minDistance = winHeight;

  $(".blog-item").each(function(){
    var dis = this.getBoundingClientRect().top;
    if(dis >= winHeight * 0.2 && dis < winHeight * 0.7 && dis < minDistance){
       minDistance = dis;
       nearest = this;
    }
  });

  if(nearest !== null){
    var id = nearest.id;
    $(".blog-item").each(function(){
      if(this.id == id){
         $(this).removeClass("rat");
         $(this).addClass("elephant");
      }
      else{
        $(this).addClass("rat");
      }
    })

  }
}


