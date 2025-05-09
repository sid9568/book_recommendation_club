class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :review, length: { maximum: 250 }
end
