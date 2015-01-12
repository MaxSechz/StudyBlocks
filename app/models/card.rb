class Card < ActiveRecord::Base
  FORMATS = %w(boolean field choice response)
  validates :front, :back, :format, :deck, presence: true
  validates :format, inclusion: { in: FORMATS }
  belongs_to :deck, inverse_of: :cards
  has_many :responses

  def average_score
    results = self.responses.map {|response| response.result}
    results.count(true) * 100 / self.responses.count
  end
end
