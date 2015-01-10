class Card < ActiveRecord::Base
  FORMATS = %w(boolean field choice response)
  validates :front, :back, :format, :deck, presence: true
  validates :format, inclusion: { in: FORMATS }
  belongs_to :deck, inverse_of: :cards
end
