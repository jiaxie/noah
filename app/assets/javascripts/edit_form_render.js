$(function(){
  // $(".edit").click(render_edit_form);
  $('.edit').click(render_edit_form);
});

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

  $.ajax("/blogs/get_blog/" + bid, {dataType:'html'}).success(function(response){
    $('.edit-form').each(function(){
      if(this.id == bid){
        $(this).html(response);

      }
    })
  });
  return false;
}
