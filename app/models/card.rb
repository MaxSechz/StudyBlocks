class Card < ActiveRecord::Base
  validates :front, :back, :deck_id, :format, presence: true

  belongs_to :deck
end
