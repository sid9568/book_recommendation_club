class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :review, length: { maximum: 250 }
  has_many :votes, dependent: :destroy
  
  def vote_count
    votes.count
  end
end
