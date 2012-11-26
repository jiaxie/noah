class NoahController < ApplicationController
  def index
    @current_user = User.find :first
    @decks = @current_user.decks
  end

  def fake_data
    clean
    user = User.new
    user.name = "Mr Dummy"
    user.save

    deck_data = {:name => "deck1"}
    deck = Deck.new deck_data
    user.decks.create! deck_data

    deck_data2 = {:name => "deck2"}
    deck = Deck.new deck_data2
    user.decks.create! deck_data2

    redirect_to :action => 'index'
  end

  def clean_fake_data
    redirect_to :action => 'index'
  end

  def clean
    User.destroy_all
  end
end
