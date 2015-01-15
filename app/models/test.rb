class Test < ActiveRecord::Base
  validates :deck_id, :user_id, presence: true

  belongs_to :user
  belongs_to :deck
  has_many :responses, inverse_of: :test, dependent: :destroy

  accepts_nested_attributes_for :responses
  
  def score
    results = self.responses.map {|response| response.result}
    correct = results.count(true) * 100/ self.responses.count
  end
end
