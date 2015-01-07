class UsersController < ApplicationController
  before_action :require_logged_in, only: [:destroy, :update, :show, :edit, :update]
  before_action :require_logged_out, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = current_user
    render :edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

end
