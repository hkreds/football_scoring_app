class Convention < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :participating_teams
  
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
