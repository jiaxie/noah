$(function(){
  hide_cancel_button();
  $('.edit').click(render_edit_form);
  $('.cancel').click(cancel_edit);
});

var hide_cancel_button = function(){
  $('.cancel').each(function(){
    $(this).hide();
  })
}

var render_edit_form = function(){
  var bid = this.id;

  $('.blog-title').each(function(){
      if(this.id == bid){
        $(this).hide();
      }
    })

  $('.blog-content').each(function(){
    if(this.id == bid){
      $(this).hide();
    }
  })

  $('.cancel').each(function(){
    if(this.id == bid){
      $(this).show();
    }
  })

  $(this).hide();

  $.ajax("/blogs/get_blog/" + bid, {dataType:'html'}).success(function(response){
    $('.edit-form').each(function(){
      if(this.id == bid){
        $(this).html(response);

      }
    })
  });
  return false;
}

var cancel_edit = function(){
  $('.edit-form form').remove();

  var bid = this.id;
  $('.blog-title').each(function(){
      if(this.id == bid){
        $(this).show();
      }
    })

  $('.blog-content').each(function(){
    if(this.id == bid){
      $(this).show();
    }
  })

  $('.edit').each(function(){
    if(this.id == bid){
      $(this).show();
    }
  })

  $(this).hide();
}
