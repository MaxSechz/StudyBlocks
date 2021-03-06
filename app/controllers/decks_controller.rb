class DecksController < ApplicationController
  before_action :ensure_deck_belongs_to_user, only: [:edit, :update, :destroy]

  def index
    @decks = current_user.decks
    render :index
  end

  def show
    @deck = Deck.where(id: params[:id]).includes(:cards).includes(:course).first
  end

  def new
    @deck = Deck.new
    render :new
  end

  def create
    @deck = current_user.decks.new(deck_params)

    if @deck.save
      redirect_to deck_url(@deck)
    else
      render :new
    end
  end

  def edit
    @deck = Deck.find(params[:id])
    render :edit
  end

  def update
    @deck = Deck.find(params[:id])

    if @deck.update(deck_params)
      redirect_to deck_url(@deck)
    else
      render :edit
    end
  end

  def destroy
    Deck.find(params[:id]).destroy
    redirect_to decks_url
  end

  private

  def ensure_deck_belongs_to_user
    redirect_to decks_url unless Deck.find(params[:id]).user_id == current_user.id
  end

  def deck_params
    params.require(:deck).permit(:title, :description, :course_id)
  end
end
