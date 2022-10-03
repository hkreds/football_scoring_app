class Player < ApplicationRecord
  has_many :player_scorings, dependent: :destroy
  has_many :affiliated_players, dependent: :destroy
  has_many :competitors, dependent: :destroy
  
  validates :name, presence: true
end
