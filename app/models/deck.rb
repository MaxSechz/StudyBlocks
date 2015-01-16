class Deck < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validate :owner_school_equals_course_school

  belongs_to :user
  belongs_to :course
  has_many :cards, inverse_of: :deck, dependent: :destroy
  has_many :tests, dependent: :destroy

  accepts_nested_attributes_for :cards

  def scores
    tests.map { |test| test.score }
  end

  def has_access?(user)
    user.courses.any? {|course| course == self.course} || self.user = user
  end

  def can_write?(user)
    self.user == user
  end

  private

  def owner_school_equals_course_school
    unless self.course.nil? || self.user.school_id == self.course.school_id
      this.errors[:base] << "That course isn't offered at your school"
    end
  end
end
