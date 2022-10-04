class Match < ApplicationRecord
  belongs_to :convention
  #試合でチームはホームチームとアウェイチームに分かれます。
  belongs_to :home_team, class_name: "Team", optional: true
  belongs_to :away_team, class_name: "Team", optional: true
  has_many :competitors, dependent: :destroy
  has_many :scorings, dependent: :destroy
  
  validates :convention_id, presence: true
  validates :start_time, presence: true
end
