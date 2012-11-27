class DeckController < ApplicationController
  def show
    @current_deck = Deck.find(params[:id])
    if @current_deck != nil
      @blogs = @current_deck.blogs
    else
      redirect_to 'noah/index'
    end
  end
end
