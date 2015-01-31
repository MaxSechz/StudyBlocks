module Api
  class CardsController < ApplicationController
    before_action :require_logged_in
    before_action :get_deck, except: [:import]
    before_action :ensure_user_has_access, only: [:show, :index]
    before_action :ensure_card_belongs_to_user, only: [:create, :update, :destroy]

    wrap_parameters :card, include: [:front, :back, :format, :deck_id, :image]

    def index
      @cards = @deck.cards
      render :index
    end

    def new
      @card = Card.new
      render :new
    end

    def show
      @card = Card.find(params[:id])
      render :show
    end

    def create
      @card = @deck.cards.new(card_params)

      if @card.save
        render :show
      else
        render json: @card.errors.messages, status: 422
      end
    end

    def edit
      @card = Card.find(params[:id])
      render :edit
    end

    def update
      @card = Card.find(params[:id])

      if @card.update(card_params)
        render :show
      else
        render json: @card.errors.messages, status: 422
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

    def ensure_user_has_access
      render json: {errors: "You don't have access to that card"} unless get_deck.has_access?(current_user)
    end

    def ensure_card_belongs_to_user
      render json: {errors: "You don't own that deck"} unless get_deck.can_write?(current_user)
    end
  end
end
