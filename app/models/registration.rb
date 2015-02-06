class Registration < ActiveRecord::Base
  validates :course, :user_id, presence: true
  validates :course, uniqueness: { scope: :user_id, message: "Already in that course"}
  belongs_to :course, inverse_of: :registrations
  belongs_to :user
end
