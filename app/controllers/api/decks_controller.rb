module Api
  class DecksController < ApplicationController
    before_action :require_logged_in
    before_action :ensure_user_has_access, only: [:show]
    before_action :ensure_user_owns_deck, only: [:edit, :update, :destroy, :import]

    def index
      @decks = current_user.decks
      render json: @decks
    end

    def show
      @deck = Deck.includes(:cards, :tests).find(params[:id])
      render :show
    end

    def new
      @deck = Deck.new
      render :new
    end

    def create
      @deck = current_user.decks.new(deck_params)
      if @deck.save
        render json: @deck
      else
        render json: @deck.errors.messages, status: 422
      end
    end

    def import
      @deck = Deck.find(params[:id])
      csv = CSV.parse(params[:csv])
      new_cards = Card.create_from_csv(csv)
      @cards = @deck.cards.<<(*new_cards)
      if @cards
        render :show
      else
        render json: @cards.errors.messages
      end
    end

    def edit
      @deck = Deck.find(params[:id])
      render :edit
    end

    def update
      @deck = Deck.find(params[:id])

      if @deck.update(deck_params)
        render json: @deck
      else
        render json: @deck.errors.messages, status: 422
      end
    end

    def destroy
      @deck = Deck.find(params[:id]).destroy
      render json: @deck
    end

    private

    def ensure_user_has_access
      render json: {errors: "You don't have access to that deck"} unless get_deck.has_access?(current_user)
    end

    def ensure_user_owns_deck
      render json: {errors: "You don't own that deck"} unless get_deck.can_write?(current_user)
    end

    def deck_params
      params.require(:deck).permit(:title, :description, :course_id,  cards_attributes: [ :id, :front, :back, :format, :deck_id, :image ])
    end
  end

end
