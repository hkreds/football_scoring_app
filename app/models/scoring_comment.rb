class ScoringComment < ApplicationRecord
  belongs_to :customer
  belongs_to :scoring
  validates :comment, presence: true
end
