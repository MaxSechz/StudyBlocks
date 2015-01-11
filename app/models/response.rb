class Response < ActiveRecord::Base
  validates :response_text, :test, :card_id, presence: true

  belongs_to :card
  belongs_to :test

  def result
    self.response_text == :card.back
  end
end
