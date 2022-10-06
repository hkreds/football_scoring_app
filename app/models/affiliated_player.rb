class AffiliatedPlayer < ApplicationRecord
  belongs_to :player
  belongs_to :team
  enum position: { GK: 0, DF: 1, MF: 2, FW: 3 }
end
