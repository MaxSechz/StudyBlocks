class Response < ActiveRecord::Base
  validates :response_text, :test, :card_id, presence: true

  belongs_to :card
  belongs_to :test, inverse_of: :responses

  def result
    if self.card.format == "field"
      back_hash_values = JSON.parse(self.card.back).values
      response_values = JSON.parse(self.response_text)
      return back_hash_values == response_values
    else
      self.response_text == self.card.back
    end
  end
end
