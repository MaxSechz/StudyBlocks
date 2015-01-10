class Deck < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validate :owner_school_equals_course_school

  belongs_to :user
  belongs_to :course
  has_many :cards, inverse_of: :deck

  accepts_nested_attributes_for :cards

  private

  def owner_school_equals_course_school
    unless self.course.nil? || self.user.school_id == self.course.school_id
      this.errors[:base] << "That course isn't offered at your school"
    end
  end
end
