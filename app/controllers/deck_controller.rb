class DeckController < ApplicationController
  def show
  end

  def create_blog
    @current_deck = Deck.find(session[:deck_id])
    @features = @current_deck.features
    @current_feature = @features.find(session[:feature_id])
    @current_feature.blogs.create! params[:blog]
    @blogs = @current_feature.blogs
    render 'show'
  end

  def show_default
    @current_deck = Deck.find(params[:id])
    @features = @current_deck.features
    @current_feature = @features.find :first
    @blogs = @current_feature.blogs
    session[:deck_id] = params[:id]
    session[:feature_id] = @current_feature.id
    render 'show'
  end

  def choose_feature
    @current_deck = Deck.find(params[:id])
    @features = @current_deck.features
    @current_feature = @features.find(params[:fid])
    @blogs = @current_feature.blogs
    session[:deck_id] = params[:id]
    session[:feature_id] = params[:fid]
    render 'show'
  end
end
