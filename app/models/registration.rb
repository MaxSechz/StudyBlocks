class Registration < ActiveRecord::Base
  validates :course_id, :user_id, presence: true

  belongs_to :course, inverse_of: :registrations
  belongs_to :user
end
