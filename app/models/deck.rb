class Deck < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user
  has_many :cards, inverse_of: :deck

  def cards=(cards)
    newcards = self.cards.build(cards)
  end
end
