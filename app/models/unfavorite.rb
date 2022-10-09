class Unfavorite < ApplicationRecord
  belongs_to :customer
  belongs_to :scoring
end
