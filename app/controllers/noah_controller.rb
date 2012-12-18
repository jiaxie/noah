class NoahController < ApplicationController

  def index
    if session[:login_at] != nil
      redirect_to "/noah/show" 
      return
    end
    redirect_to "/noah/login"  
  end

  def login
  end

  def login_validate
    if params[:oracle]  == "7"
      session[:login_at] = Time.now
      redirect_to "/noah/show"
    else
      flash[:error_message] = "invalid"
      redirect_to "/noah/login" 
    end
  end

  def show
    @current_user = User.find :first
    if(@current_user == nil)
      fake_data
    end

    @current_user = User.find :first
    @decks = @current_user.decks
    session[:user_id] = @current_user.id
  end

  def fake_data
    clean
    user = User.new
    user.name = "Mr Dummy"
    user.save

    deck_data = {:name => "deck1"}
    deck_data2 = {:name => "deck2"}

    user.decks.create! deck_data
    user.decks.create! deck_data2
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
