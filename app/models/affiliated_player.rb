class AffiliatedPlayer < ApplicationRecord
  belongs_to :players, optional: true
  belongs_to :teams, optional: true
  enum position: { GK: 0, DF: 1, MF: 2, FW: 3 }
end
