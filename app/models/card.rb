class Card < ActiveRecord::Base
  FORMATS = %w(boolean field choice response)
  validates :back, :format, :deck, presence: true
  validates :format, inclusion: { in: FORMATS }
  validate :has_image_or_front

  has_attached_file :image, default_url: '', styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :deck, inverse_of: :cards
  has_many :responses, dependent: :destroy

  def average_score
    responses = self.responses.count
    return responses if responses == 0
    results = self.responses.map {|response| response.result}
    results.count(true) * 100 / self.responses.count
  end

  private

  def has_image_or_front
    if image.nil? && front.nil?
        errors.add(:base, "Must have either an image or text on the front of the card")
    end
  end

end
