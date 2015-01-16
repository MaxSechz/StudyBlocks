class Registration < ActiveRecord::Base
  validates :course, :user_id, presence: true

  belongs_to :course, inverse_of: :registrations
  belongs_to :user
end
