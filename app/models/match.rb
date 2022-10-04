class Match < ApplicationRecord
  belongs_to :convention
  belongs_to :home_team
  belongs_to :away_team
  has_many :competitors, dependent: :destroy
  has_many :scorings, dependent: :destroy
  
  validates :convention_id, presence: true
  validates :start_time, presence: true
end
