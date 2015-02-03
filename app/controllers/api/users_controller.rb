module Api
  class UsersController < ApplicationController
    before_action :require_logged_in, only: [:destroy, :update, :edit, :update]
    before_action :require_logged_out, only: [:new, :create]

    def show
      @user = current_user
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
        render :show
      else
        render json: @user
      end
    end

    def edit
      @user = current_user
      render :edit
    end

    def update
      @user = current_user
      if valid_password_change? && @user.update(user_params)
        render :show
      else
        render :edit
      end
    end

    def destroy
      User.find(params[:id]).destroy
      redirect_to root_url
    end

    private

    def valid_password_change?
      return true if params[:user][:password].empty? || params[:user][:password].nil?
      if params[:user][:new_password] == params[:user][:password_confirm]
        params[:user][:password] = params[:user][:new_password]
      end
      return true
    end
  end
end
