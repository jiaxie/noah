class FeaturesController < ApplicationController
  def show
    @observer_mode = true
    if session[:current_user].present? && session[:watching_user].present?
      @observer_mode = session[:current_user].id != session[:watching_user].id 
    end
    
    @current_user = session[:watching_user]
    @current_deck = @current_user.decks.find(:first)
    @features = @current_deck.features
    @current_feature = @features.find(:first)
    @blogs = @current_feature.blogs.order('created_at DESC')
    session[:deck_id] = @current_deck.id
    session[:feature_id] = @current_feature.id
  end
end
