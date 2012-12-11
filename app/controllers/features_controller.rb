class FeaturesController < ApplicationController
  def show
    @current_deck = Deck.find(session[:deck_id])
    @features = @current_deck.features
    @current_feature = @features.find :first
    @blogs = @current_feature.blogs
  end
end
