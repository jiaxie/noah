$(function(){
    Blog('.blog-item');
});
function Blog(selector){
    if($(selector).size() > 1){
        var blogs = [];
        $(selector).each(function(idx, item){
            blogs.push(new Blog(item));
        });
        return blogs;
    }else{
        this.init(selector);
    }
}

Blog.prototype = {
  init: function(selector){
    var $selector = $(selector);
    this.title = $selector.find('.blog-title');
    this.content = $selector.find('.blog-content');
    this.formContainer = $selector.find('.edit-form');
    this.editBtn = $selector.find('.operation .edit-icon');
    this.cancelBtn = $selector.find('.operation .cancel');
    this.blogItem = $selector;
    this.blogId = $selector.attr('id');
    this.bindEvents();
  },
  bindEvents: function(){
    this.editBtn.click(this.proxy(function(){
        this.render_edit_form(this.blogItem);
    }));

    this.cancelBtn.click(this.proxy(function(){
        this.blogItem.removeClass('edit');
    }));
  },
  render_edit_form: function(){
    this.blogItem.addClass('edit');

    $.ajax("/blogs/get_blog/" + this.blogId,
      {dataType:'html'}).success(this.proxy(function(response){
        this.formContainer.html(response);
        this.formContainer.find('form').submit(this.proxy(this.submitBlog));
    }));
    return false;
  },
  submitBlog: function(evt){
    this.formContainer.find('form').ajaxSubmit({
        dataType: 'json',
        success: this.proxy(function(response){
            var blogNode = this.title.contents().last()[0];

            if('textContent' in blogNode){
               blogNode.textContent = response.title;
            }else{
               blogNode.innerText = response.title;
            }
            this.content.html(response.content);
            this.cancelEdit();
        })
    });
    return false;
  },
  cancelEdit: function(){
     this.blogItem.removeClass('edit');
  },
  proxy: function(callback){
      var _ = this;
      return function(){
        return callback.apply(_, arguments);
      };
  }
};

