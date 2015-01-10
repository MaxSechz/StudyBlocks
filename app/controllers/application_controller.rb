class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user
  # wrap_parameters false
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
  end

  def logout!(user)
    current_user.reset_token!
    session[:session_token] = nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to root_url if logged_in?
  end

  def user_params
    new_params = params.require(:user).permit(:username, :password, :email, :school_id)
    new_params[:password].empty? ? new_params.except(:password) : new_params
  end
end
