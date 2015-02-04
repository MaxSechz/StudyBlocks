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
        password_error = @user.errors.messages[:password_digest]
        @user.errors.add(:password, password_error)
        render json: @user.errors.messages.except(:password_digest), status: 422
      end
    end

    def edit
      @user = current_user
      render :edit
    end

    def update
      @user = current_user
      if @user.update(user_params)
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

    def update_params
      user_params.except(:password)
    end
  end
end
