class AffiliatedPlayer < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :team, optional: true
  enum position: { GK: 0, DF: 1, MF: 2, FW: 3 }
end
