class BlogsController < ApplicationController
  def create
    @current_deck = Deck.find(session[:deck_id])
    @features = @current_deck.features
    @current_feature = @features.find(session[:feature_id])
    @current_feature.blogs.create! params[:blog]
    @blogs = @current_feature.blogs
    goto_deck
  end

  def destroy
    @current_deck = Deck.find(params[:deck_id])
    @features = @current_deck.features
    @current_feature = @features.find(params[:feature_id])
    @blog = @current_feature.blogs.find(params[:id])
    @blog.destroy
    @blogs = @current_feature.blogs
    goto_deck
  end

  def edit
    @current_deck = Deck.find(params[:deck_id])
    @current_feature = @current_deck.features.find(params[:feature_id])
    @blog = @current_feature.blogs.find(params[:id])
  end

  def update
    p "***********"
    @blog = Blog.find(params[:id])
    @blog.update_attributes(params[:blog])
    respond_to do |format|
      format.json { render :json => {:title => @blog.title, :content => @blog.content}}
    end
  end


  def get_blog
    @edited_blog = Blog.find(params[:bid])
    @deck_id = session[:deck_id] 
    @feature_id = session[:feature_id]
    render :partial => 'edit_form'
  end

  def goto_deck
    redirect_to deck_feature_path(session[:deck_id],session[:feature_id])
  end
end
