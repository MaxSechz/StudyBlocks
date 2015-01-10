class Course < ActiveRecord::Base
  validates :title, :course_code, :instructor, :school_id, presence: true

  belongs_to :school
  has_many :registrations, inverse_of: :course
  has_many :users, through: :registrations, source: :user
  has_many :decks
end
