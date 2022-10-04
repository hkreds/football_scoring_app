class Opponent < ApplicationRecord
  belongs_to :home_team, class_name: "match"
  belongs_to :away_team, class_name: "match"
end
