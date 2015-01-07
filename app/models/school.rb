class School < ActiveRecord::Base
  validates :name, :country, :state, :city, presence: true

  has_many :users
  has_many :courses
end
