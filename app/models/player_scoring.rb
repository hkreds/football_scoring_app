class PlayerScoring < ApplicationRecord
  belongs_to :scoring
  belongs_to :competitor
  
  validates :score, presence: true
  validates :review, length: { maximum: 100 }
  
end
