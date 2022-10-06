class ParticipatingTeam < ApplicationRecord
  belongs_to :convention
  belongs_to :team
  validates :team_id, uniqueness:{
    scope: [:convention_id]
  }
end
