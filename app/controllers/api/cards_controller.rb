module Api
  class CardsController < ApplicationController
    before_action :get_deck
    before_action :ensure_card_belongs_to_user

    wrap_parameters :card, include: [:front, :back, :format, :deck_id, :image]

    def index
      @cards = @deck.cards
      render json: @cards
    end

    def new
      @card = Card.new
      render :new
    end

    def create
      @card = @deck.cards.new(card_params)

      if @card.save
        render json: @card
      else
        render json: @card.errors
      end
    end

    def edit
      @card = Card.find(params[:id])
      render :edit
    end

    def update
      @card = Card.find(params[:id])

      if @card.update(card_params)
        render json: @card
      else
        render json: @card.errors.messages
      end
    end

    def destroy
      @card = Card.find(params[:id]).destroy
      render json: @card
    end

    private

    def card_params
      params.require(:card).permit(:front, :back, :format, :deck_id, :image)
    end

    def get_deck
      @deck = Deck.find(params[:deck_id])
    end

    def ensure_card_belongs_to_user
      redirect_to decks_url unless @deck.user_id == current_user.id
    end
  end

end
