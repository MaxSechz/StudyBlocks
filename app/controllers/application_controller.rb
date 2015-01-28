class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user, :has_access?, :can_write?

  private

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_token!
    @current_user = user
    if @current_user.username == "Guest"
      require "./db/guest_seeds.rb"
    end
  end

  def logout!(user)
    current_user.reset_token!
    session[:session_token] = nil
  end

  def require_logged_in
    redirect_to '#' unless logged_in?
  end

  def require_logged_out
    redirect_to '#' if logged_in?
  end

  def get_deck
    @deck ||= Deck.find(params[:deck_id] || params[:id])
  end

  def user_params
    new_params = params.require(:user).permit(:username, :password, :email, :school_id,
    school_attributes: [ :name, :country, :state, :city]
    )
    new_params[:password].nil? || new_params[:password].empty? ? new_params.except(:password) : new_params
  end
end
