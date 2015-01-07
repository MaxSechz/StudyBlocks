class CardsController < ApplicationController
  before_action :ensure_card_belongs_to_user

  def new
    @card = Card.new
    render :new
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.new(card_params)

    if @card.save
      redirect_to deck_url(@deck)
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
    render :edit
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to deck_url(@card.deck_id)
    else
      render :edit
    end
  end

  def destroy
    @card = Card.find(params[:id]).destroy
    redirect_to deck_url(@card.deck_id)
  end

  private

  def ensure_card_belongs_to_user
    redirect_to decks_url unless Deck.find(params[:deck_id]).user_id == current_user.id
  end
end
