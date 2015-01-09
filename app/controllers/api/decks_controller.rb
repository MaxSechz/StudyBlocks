module Api
  class DecksController < ApplicationController
    before_action :ensure_deck_belongs_to_user, only: [:edit, :update, :destroy]

    def index
      @decks = current_user.decks
      render json: @decks
    end

    def show
      @deck = Deck.includes(:cards).find(params[:id])
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

    def edit
      @deck = Deck.find(params[:id])
      render :edit
    end

    def update
      @deck = Deck.find(params[:id])

      if @deck.update(deck_params)
        render json: @deck
      else
        render :edit
      end
    end

    def destroy
      @deck = Deck.find(params[:id]).destroy
      render json: @deck
    end

    private

    def ensure_deck_belongs_to_user
      redirect_to decks_url unless Deck.find(params[:id]).user_id == current_user.id
    end

    def deck_params
      params.require(:deck).permit(:title, :description, :course_id,  cards: [ :id, :front, :back, :format ])
    end
  end

end
