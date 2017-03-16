class Review < ApplicationRecord
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5, allow_nil: false }, numericality: true

  belongs_to :restaurant
end
