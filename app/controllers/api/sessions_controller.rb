module Api
  class SessionsController < ApplicationController
    before_action :require_logged_in, only: :destroy
    before_action :require_logged_out, only: [:new, :create]

    def new
      @user = User.new
      render :new
    end

    def create
      @user = User.find_by_credentials(user_params)

      if @user.errors.empty?
        login!(@user)
        render "api/users/show"
      else
        render json: @user.errors.messages, status: 422
      end
    end

    def omniauth
      user = User.find_or_create_by_auth_hash(auth_hash)
      login!(user)
      redirect_to "#/decks"
    end


    def destroy
      logout!(current_user)
      redirect_to "#"
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end

  end
end
