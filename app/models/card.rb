class Card < ActiveRecord::Base
  validates :front, :back, :format, :deck, presence: true

  belongs_to :deck, inverse_of: :cards
end
