class NoahController < ApplicationController

  def index
    find_latest_blog
    redirect_to "/noah/login" 
  end

  def login
    if @latest_blogs == nil
      find_latest_blog
    end
  end

  def logout
    session[:login_at] = nil
    session[:current_user] = nil
    redirect_to "/noah/login"
  end


  def login_validate
    if user_validate
      session[:login_at] = Time.now

      redirect_to "/decks/0/features/0"
    else
      flash[:error_message] = "your password is incorrect!"
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

    i = 10

    loop{
      if i == 0
        break
      else
        user = User.create!({:name => 'drupal' + i.to_s, :password => 'incorrect' + i.to_s})
        deck_data = { :name => "deck" }
        user.decks.create! deck_data
        feature_data = {:name => "blog"}

        deck = user.decks.find :first 
        deck.features.create! feature_data

        i = i - 1
      end
    }

    redirect_to "/noah/login"
  end

  def clean_fake_data
    User.destroy_all
    Deck.destroy_all
    Feature.destroy_all
    Blog.destroy_all
    redirect_to :action => 'index'
  end

  def find_latest_blog
    @latest_blogs = Blog.order('created_at DESC').find(:all)
    if(@latest_blogs.length > 5)
      @latest_blogs = @latest_blogs[0,5]
    end
  end

  def clean
    User.destroy_all
    Deck.destroy_all
    Feature.destroy_all
    Blog.destroy_all
  end
end
