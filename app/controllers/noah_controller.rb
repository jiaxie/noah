class NoahController < ApplicationController

  def index
    if session[:login_at].present?
      redirect_to "/noah/show" 
    else
      redirect_to "/noah/login"
    end  
  end

  def login
  end

  def login_validate
    if user_validate
      session[:login_at] = Time.now
      redirect_to "/noah/show"
    else
      flash[:error_message] = "invalid"
      redirect_to "/noah/login" 
    end
  end

  def user_validate
    session[:current_user] = User.find_by_name_and_password(params[:username], params[:password])
    session[:current_user].present?
  end

  def show
    @current_user = session[:current_user]
    @decks = @current_user.decks
  end

  def fake_data
    clean
    user = User.create!({:name => 'admin', :password => 'admin123'})
    deck_data = { :name => "deck1" }
    deck_data2 = { :name => "deck2" }

    user.decks.create! deck_data
    user.decks.create! deck_data2

    feature_data = {:name => "blog"}
    feature_data2 = {:name => "resource"}

    deck = user.decks.find :first
    deck.features.create! feature_data
    deck.features.create! feature_data2

    deck2 = user.decks.find :last
    deck2.features.create! feature_data
    deck2.features.create! feature_data2
    redirect_to "/noah/login"
  end

  def clean_fake_data
    User.destroy_all
    Deck.destroy_all
    Feature.destroy_all
    Blog.destroy_all
    redirect_to :action => 'index'
  end

  def clean
    User.destroy_all
    Deck.destroy_all
    Feature.destroy_all
    Blog.destroy_all
  end
end
