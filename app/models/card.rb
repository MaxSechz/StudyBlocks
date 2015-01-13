class Card < ActiveRecord::Base
  FORMATS = %w(boolean field choice response)
  validates :front, :back, :format, :deck, presence: true
  validates :format, inclusion: { in: FORMATS }

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :deck, inverse_of: :cards
  has_many :responses

  def average_score
    responses = self.responses.count
    return responses if responses == 0
    results = self.responses.map {|response| response.result}
    results.count(true) * 100 / self.responses.count
  end
end
