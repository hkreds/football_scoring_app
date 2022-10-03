class Player < ApplicationRecord
  has_many :player_scorings
  has_many :affiliated_players
  has_many :competitors
  
  validates :name, presence: true
end
