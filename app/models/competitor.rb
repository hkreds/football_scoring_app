class Competitor < ApplicationRecord
  belongs_to :player
  belongs_to :match
  enum position: { GK: 0, DF: 1, MF: 2, FW: 3 }
  
  validates :uniform_number, presence: true
  validates :player_id, uniqueness:{
    scope: [:match_id]
  }
end
