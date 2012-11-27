class DeckController < ApplicationController
  def show
    @current_deck = Deck.find(params[:id])
    if @current_deck != nil
      @features = @current_deck.features
    else
      redirect_to 'noah/index'
    end
  end
end
