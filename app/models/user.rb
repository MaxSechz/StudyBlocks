class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token

  validates :username, :password_digest, :email, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_many :decks
  belongs_to :school, inverse_of: :users
  has_many :registrations
  has_many :courses, through: :registrations, source: :course

  accepts_nested_attributes_for :school

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
    provider: auth_hash[:provider],
    uid: auth_hash[:uid])

    if user.nil?
      user = User.find_by(email: auth_hash[:info][:email])
      if user
        user.provider = auth_hash[:provider]
        user.uid = auth_hash[:uid]
        user.save!
      end
    end

    if user.nil?
      user = User.create!(
      username: auth_hash[:info][:email],
      email: auth_hash[:info][:email],
      password: SecureRandom::urlsafe_base64,
      provider: auth_hash[:provider],
      uid: auth_hash[:uid])
    end

    user
  end

  def self.generate_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(creds)
    sql_params = "username = :u OR email = :e"
    sql_vars = { u: creds[:username], e: creds[:email] }
    search_params = [sql_params, sql_vars]
    user = User.where(search_params).first_or_initialize
    user.test_password_set(creds[:password])
    user
  end

  def valid_password_and_name?
    if self.id.nil? || !self.is_password?(@password)
      self.errors.add(:base, "Invalid username/email and password combination")
      return false
    end
    true
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def test_password_set(test_password)
    @password = test_password
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
