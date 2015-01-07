class UsersController < ApplicationController

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
