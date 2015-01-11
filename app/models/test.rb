class Test < ActiveRecord::Base
  validates :deck_id, presence: true

  belongs_to :deck
  has_many :responses

  def score
    responses.count { |response| response.result } / responses.count
  end
end
