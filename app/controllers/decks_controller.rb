class DecksController < ApplicationController
  def show
    show_default
    redirect_to deck_feature_path(session[:deck_id], session[:feature_id]) 
  end

  def new

  end

  def show_default
    @current_deck = Deck.find(params[:id])
    @features = @current_deck.features
    @current_feature = @features.find :first
    @blogs = @current_feature.blogs
    session[:deck_id] = params[:id]
    session[:feature_id] = @current_feature.id
  end
end
