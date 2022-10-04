class Match < ApplicationRecord
  belongs_to :convention
  has_many :opponents, dependent: :destroy
  has_many :competitors, dependent: :destroy
  has_many :scorings, dependent: :destroy
  
  validates :convention_id, presence: true
  validates :start_time, presence: true
end
