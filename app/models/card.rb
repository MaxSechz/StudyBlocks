class Card < ActiveRecord::Base
  FORMATS = %w(boolean field choice response)
  validates :back, :format, :deck, presence: true
  validates :format, inclusion: { in: FORMATS }
  validate :has_image_or_front

  has_attached_file :image, default_url: '', styles: { medium: "300x300>", thumb: "100x100>" }, preserve_files: "true"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :deck, inverse_of: :cards
  has_many :responses, dependent: :destroy

  def average_score
    responses = self.responses.count
    return responses if responses == 0
    results = self.responses.map {|response| response.result}
    results.count(true) * 100 / self.responses.count
  end

  def self.create_from_csv(csv)
    cards = []
    csv.each do |row|
      card = Card.new
      if row[0] =~ /[a-zA-Z0-9\-\.]+\.(com|org|net|mil|edu|COM|ORG|NET|MIL|EDU)/
        card.image = row[0]
      else
        card.front = row[0]
      end
      card.back = row[1]
      card.format = "response"
      cards.push(card)
    end

    cards
  end

  private

  def has_image_or_front
    if image.nil? && front.nil?
        errors.add(:base, "Must have either an image or text on the front of the card")
    end
  end

end
