class Book < ApplicationRecord
  has_many :recommendations, dependent: :destroy
end
