class Session < ActiveRecord::Base
  after_initialize :ensure_session_token
  validates :session_token, :user, presence: true
  belongs_to :user

  def self.generate_token
    SecureRandom::urlsafe_base64
  end

  def reset!
    self.session_token = self.class.generate_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_token
  end
end
