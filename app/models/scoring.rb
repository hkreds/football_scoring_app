class Scoring < ApplicationRecord
  belongs_to :customer
  belongs_to :match
  #複数の出場選手に採点を行いますが、出場選手は複数の採点をされます。
  has_many :player_scorings
  has_many :competitors, through: :player_scorings
  accepts_nested_attributes_for :player_scorings, allow_destroy: true
end
