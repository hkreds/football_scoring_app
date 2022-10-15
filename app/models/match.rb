class Match < ApplicationRecord
  belongs_to :convention
  #試合でチームはホームチームとアウェイチームに分かれます。
  belongs_to :home_team, class_name: "Team", optional: true
  belongs_to :away_team, class_name: "Team", optional: true
  #試合には複数の選手が出場し、選手は複数の試合に出場します。
  has_many :competitors
  has_many :players, through: :competitors
  accepts_nested_attributes_for :competitors, allow_destroy: true
  has_many :scorings, dependent: :destroy
  
  validates :convention_id, presence: true
  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
  validates :start_time, presence: true
end
