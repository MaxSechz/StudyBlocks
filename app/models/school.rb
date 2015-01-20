class School < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search,
  against: [:name, :country, :state, :city],
  :using => {
    :tsearch => {:prefix => true}
  }
  validates :name, :country, :state, :city, presence: true
  validates :name, uniqueness: true

  has_many :users, inverse_of: :school
  has_many :courses
end
