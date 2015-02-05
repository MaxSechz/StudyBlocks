class Response < ActiveRecord::Base
  validates :test, :card_id, presence: true

  belongs_to :card
  belongs_to :test, inverse_of: :responses

  def result
    return false if self.response_text.nil?
    if self.card.format == "field"
      back_hash_values = JSON.parse(self.card.back).values
      response_values = JSON.parse(self.response_text).values
      return back_hash_values.map(&:downcase) == response_values.map(&:downcase)
    else
      self.response_text.downcase == self.card.back.downcase
    end
  end
end
