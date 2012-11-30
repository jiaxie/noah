class DeckController < ApplicationController
  def show
  end

  def show_default
    @current_deck = Deck.find(params[:id])
    @features = @current_deck.features
    @current_feature = @features.find :first
    @blogs = @current_feature.blogs
    render 'show'
  end

  def choose_feature
    @current_deck = Deck.find(params[:id])
    @features = @current_deck.features
    @current_feature = @features.find(params[:fid])
    @blogs = @current_feature.blogs
    render 'show'
  end
end
