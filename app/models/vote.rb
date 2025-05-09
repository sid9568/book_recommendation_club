class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :recommendation
  validates :user_id, uniqueness: { scope: :recommendation_id }
end
