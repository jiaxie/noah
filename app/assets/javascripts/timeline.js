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
    $(this).addClass("fade");
  })

  $(".blog-item :first").removeClass("fade");
}

var markElephant = function(){
  var nearest = null;
  var winHeight;

  if (window.innerHeight){
    winHeight = window.innerHeight;
  }
  else if((document.body) && (document.body.clientHeight)){
    winHeight = document.body.clientHeight;
  }

  $(".blog-item").each(function(){
    var topDis = this.getBoundingClientRect().top;
    var bottomDis = this.getBoundingClientRect().bottom;
     if(topDis < winHeight*0.4 && bottomDis >= winHeight*0.4){
         nearest = this;
     }
  });

  if(nearest !== null){
    var id = nearest.id;
    $(".blog-item").each(function(){
      if(this.id == id){
         $(this).removeClass("fade");
      }
      else{
        $(this).addClass("fade");
      }
    })

  }
}


