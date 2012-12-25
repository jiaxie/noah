class FeaturesController < ApplicationController
  def show
    @current_user = session[:current_user]
    @current_deck = @current_user.decks.find(:first)
    @features = @current_deck.features
    @current_feature = @features.find(:first)
    @blogs = @current_feature.blogs.order('created_at DESC')
    session[:deck_id] = @current_deck.id
    session[:feature_id] = @current_feature.id
  end
end
