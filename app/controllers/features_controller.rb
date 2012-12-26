class FeaturesController < ApplicationController
  def show
    @observer_mode = true
    if session[:logged_uid].present? && session[:observed_uid].present?
      @observer_mode = session[:logged_uid] != session[:observed_uid] 
    end

    uid = session[:observed_uid]
    @current_user = User.find(uid)
    @current_deck = @current_user.decks.find(:first)
    @features = @current_deck.features
    @current_feature = @features.find(:first)
    @blogs = @current_feature.blogs.order('created_at DESC')
    session[:deck_id] = @current_deck.id
    session[:feature_id] = @current_feature.id
  end
end
