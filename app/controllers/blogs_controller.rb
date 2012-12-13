class BlogsController < ApplicationController
  def create
    @current_deck = Deck.find(session[:deck_id])
    @features = @current_deck.features
    @current_feature = @features.find(session[:feature_id])
    @current_feature.blogs.create! params[:blog]
    @blogs = @current_feature.blogs
    redirect_to deck_path(session[:deck_id]) 
  end

  def destroy
    @current_deck = Deck.find(params[:deck_id])
    @features = @current_deck.features
    @current_feature = @features.find(params[:feature_id])
    @blog = @current_feature.blogs.find(params[:id])
    @blog.destroy
    @blogs = @current_feature.blogs
    redirect_to deck_path(params[:deck_id])
  end

  def edit
    @current_deck = Deck.find(params[:deck_id])
    @current_feature = @current_deck.features.find(params[:feature_id])
    @blog = @current_feature.blogs.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(params[:blog])
    redirect_to deck_path(params[:deck_id])
  end

  def get_blog
    @edited_blog = Blog.find(params[:bid])
    @deck_id = session[:deck_id] 
    @feature_id = session[:feature_id]
    render :partial => 'edit_form'
  end
end
