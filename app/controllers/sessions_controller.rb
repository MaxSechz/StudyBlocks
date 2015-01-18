class SessionsController < ApplicationController
  before_action :require_logged_in, only: :destroy
  before_action :require_logged_out, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)

    if @user.valid_password_and_name?
      login!(@user)
      redirect_to '#/decks'
    else
      render :new
    end
  end

  def destroy
    logout!(current_user)
    redirect_to root_url
  end

end
