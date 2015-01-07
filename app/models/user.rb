class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token

  validates :username, :password_digest, :email, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }


  def self.generate_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(creds)
    sql_params = "username = :u OR email = :e"
    sql_vars = { u: creds[:username], e: creds[:email] }
    search_params = [sql_params, sql_vars]
    user = User.where(search_params).first_or_initialize
    user.validate_password_and_name(creds[:password])
  end

  def validate_password_and_name(password)
    if user.id.nil? || !user.is_password?(password)
      user.errors.add(:base, "Invalid username/email and password combination")
    end
    user
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(new_pass)
    @password = new_pass
    self.password_digest = BCrypt::Password.create(@password)
  end

  def reset_token!
    self.session_token = self.class.generate_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_token
  end
end
