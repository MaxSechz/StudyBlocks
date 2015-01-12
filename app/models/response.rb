class Response < ActiveRecord::Base
  validates :response_text, :test, :card_id, presence: true

  belongs_to :card
  belongs_to :test, inverse_of: :responses

  def result
    self.response_text == self.card.back
  end
end
