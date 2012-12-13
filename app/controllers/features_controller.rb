class FeaturesController < ApplicationController
  def show
    @current_deck = Deck.find(params[:deck_id])
    @features = @current_deck.features
    @current_feature = @features.find(params[:id])
    @blogs = @current_feature.blogs
  end
end
