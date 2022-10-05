class Convention < ApplicationRecord
  has_many :matches, dependent: :destroy
  #大会には複数のチームが参加しますが、チームは複数の大会に参加します。
  has_many :participating_teams
  has_many :teams, through: :participating_teams
  accepts_nested_attributes_for :participating_teams, allow_destroy: true
  
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
