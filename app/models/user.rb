class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token

  validates: :username, :password_digest, :email, :session_token, presence: true
  validates: :password, length: { minimum: 6, allow_nil: true }
  validates: :username, :email, uniqueness: true
  validates: :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}


  def self.generate_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(creds)
    user = User.where(["username = :u OR email = :e", { u: creds[:username] e: creds[:email] }]).first
    return user.errors[:identity] = "Invalid username or email" if user.nil?
    return user if user.is_password?(creds[:password])
    nil
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
