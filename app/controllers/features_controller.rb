class FeaturesController < ApplicationController
  def show
    @current_deck = Deck.find(params[:deck_id])
    @features = @current_deck.features
    @current_feature = @features.find(params[:id])
    @blogs = @current_feature.blogs.order('created_at DESC')
    session[:deck_id] = params[:deck_id]
    session[:feature_id] = @current_feature.id
  end
end
