class UsersController < ApplicationController
  before_action :require_logged_in, only: [:destroy, :update, :show]
  before_action :require_logged_out, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

end
