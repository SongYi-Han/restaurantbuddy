class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: {message: " please type something."}, uniqueness: { scope: :restaurant }
end
