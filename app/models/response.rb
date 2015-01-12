class Response < ActiveRecord::Base
  validates :response_text, :test, :card_id, presence: true

  belongs_to :card
  belongs_to :test, inverse_of: :responses

  def result
    if self.card.format == "field"
      back_hash = JSON.parse(self.card.back)
      return back_hash.values.any? { |value| value == self.response_text}
    else
      self.response_text == self.card.back
    end
  end
end
