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
end
