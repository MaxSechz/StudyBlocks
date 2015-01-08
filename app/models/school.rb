class School < ActiveRecord::Base
  validates :name, :country, :state, :city, presence: true
  validates :name, uniqueness: true

  has_many :users, inverse_of: :school
  has_many :courses
end
