class Deck < ActiveRecord::Base
  validates :title, :front, :back, :user_id, presence: true

  belongs_to :user
end
