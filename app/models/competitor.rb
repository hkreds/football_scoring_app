class Competitor < ApplicationRecord
  belongs_to :player
  belongs_to :match
  #複数の出場選手に採点を行いますが、出場選手は複数の採点をされます。
  has_many :player_scorings
  has_many :scorings, through: :player_scorings
  accepts_nested_attributes_for :player_scorings, allow_destroy: true

  enum position: { GK: 0, DF: 1, MF: 2, FW: 3 }

  validates :uniform_number, presence: true
  validates :player_id, uniqueness:{
    scope: [:match_id]
  }
end
