class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user, :has_access?, :can_write?

  private

  def current_user
    @current_user ||= User.includes(:sessions).includes(:courses).find_by(sessions: { session_token: session[:session_token] })
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_token!
    @current_user = user
    if @current_user.username == "Guest"
      first_deck = @current_user.decks.first
      first_card = first_deck.cards.first
      new_deck_id = first_deck.id
      new_card_id = first_card.id
      @current_user.decks.destroy_all
      ActiveRecord::Base.connection.execute("ALTER SEQUENCE decks_id_seq RESTART WITH #{new_deck_id}")
      ActiveRecord::Base.connection.execute("ALTER SEQUENCE cards_id_seq RESTART WITH #{new_card_id}")
      load "./db/guest_seeds.rb"
      ActiveRecord::Base.connection.execute("ALTER SEQUENCE decks_id_seq RESTART WITH #{Deck.last.id + 1}")
      ActiveRecord::Base.connection.execute("ALTER SEQUENCE cards_id_seq RESTART WITH #{Card.last.id + 1}")
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
    @deck ||= Deck.includes(:user).find(params[:deck_id] || params[:id])
  end

  def user_params
    new_params = params.require(:user).permit(:username, :password, :email, :school_id,
    school_attributes: [ :name, :country, :state, :city]
    )
    new_params[:password].nil? || new_params[:password].empty? ? new_params.except(:password) : new_params
  end
end
