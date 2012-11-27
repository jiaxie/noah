class NoahController < ApplicationController

  def index
    @current_user = User.find :first
    if(@current_user != nil)
      @decks = @current_user.decks
    end
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

    first_deck = user.decks.find :first

    blog_data = {:title => "blog1", :content => "this is testing blog."}
    first_deck.blogs.create! blog_data

    blog_data2 = {:title => "blog2", :content => "this is another testing blog."}
    first_deck.blogs.create! blog_data2

    redirect_to :action => 'index'
  end

  def clean_fake_data
    User.destroy_all
    Deck.destroy_all
    Blog.destroy_all
    redirect_to :action => 'index'
  end

  def clean
    User.destroy_all
  end
end
