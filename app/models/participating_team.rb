class ParticipatingTeam < ApplicationRecord
  belongs_to :convention
  belongs_to :team
end
