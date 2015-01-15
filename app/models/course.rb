class Course < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search,
                  against: [:title, :instructor, :course_code],
                  :using => {
                    :tsearch => {:prefix => true}
                  }
  validates :title, :course_code, :instructor, :school_id, presence: true

  belongs_to :school
  has_many :registrations, inverse_of: :course
  has_many :users, through: :registrations, source: :user
  has_many :decks
end
