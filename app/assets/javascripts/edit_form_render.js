$(function(){
  $('.edit-icon').click(function(){
      var blogItem = $(this).parents('.blog-item');
      render_edit_form(blogItem);
  });
  $('.cancel').click(function(){
       var blogItem = $(this).parents('.blog-item');
       cancel_edit(blogItem);
  });
});
function submit_blog(){
    var $that = $(this);
    $that.ajaxSubmit({
        dataType: 'json',
        success: function(response){
            var blogTitle =  $that.parent().siblings('.blog-title');
            var blogContent = $that.parent().siblings('.blog-content');
            var blogNode = $(blogTitle).contents().last()[0];
            var blogItem = $that.parents('.blog-item');

            if('textContent' in blogNode){
               blogNode.textContent = response.title;
            }else{
               blogNode.innerText = response.title;
            }
            $(blogContent).html(response.content);

            cancel_edit(blogItem);
        }
    });
    return false;
}

function render_edit_form(blogItem){
  $(blogItem).addClass('edit');
  var bid = $(blogItem).attr("id");
  $.ajax("/blogs/get_blog/" + bid,
      {dataType:'html'}).success(function(response){
        $('.edit-form').each(function(){
          if(this.id == bid){
             $(this).html(response);
             $(this).find('form.edit_blog').submit(submit_blog);
          }
    })
  });
  return false;
}
function cancel_edit(blogItem){
  $(blogItem).removeClass('edit');
}
