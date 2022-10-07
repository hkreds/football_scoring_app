class PlayerScoring < ApplicationRecord
  belongs_to :scoring
  belongs_to :competitor
end
