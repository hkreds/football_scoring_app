class ParticipatingTeam < ApplicationRecord
  belongs_to :convention, optional: true
  belongs_to :team, optional: true
end
