class AffiliatedPlayer < ApplicationRecord
  belongs_to :players, optional: true
  belongs_to :teams, optional: true
end
