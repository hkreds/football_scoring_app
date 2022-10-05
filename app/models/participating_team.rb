class ParticipatingTeam < ApplicationRecord
  belongs_to :conventions, optional: true
  belongs_to :teams, optional: true
end
