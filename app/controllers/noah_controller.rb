class NoahController < ApplicationController

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

    feature1 = {:name => "life"}
    feature2 = {:name => "work"}

    blog_data = {:title => "blog1", :content => "this is testing blog."}
    blog_data2 = {:title => "blog2", :content => "this is another testing blog."}
    blog_data3 = {:title => "blog3", :content => " 3 this is testing blog."}
    blog_data4 = {:title => "blog4", :content => "4 this is another testing blog."}

    user.decks.create! deck_data
    user.decks.create! deck_data2

    first_deck = user.decks.find :first
    second_deck = user.decks.find :last
    p "***************"
    p second_deck.id

    first_deck.features.create! feature1
    first_deck.features.create! feature2

    second_deck.features.create! feature1
    second_deck.features.create! feature2


    first_deck.features.first.blogs.create! blog_data
    first_deck.features.first.blogs.create! blog_data2

    second_deck.features.first.blogs.create! blog_data3
    second_deck.features.first.blogs.create! blog_data4
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
