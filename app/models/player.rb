class Player < ApplicationRecord
  has_many :player_scorings, dependent: :destroy
  has_many :competitors, dependent: :destroy
  #チームは複数の選手が所属しますが、選手は複数のチームに所属する可能性があります。
  has_many :affiliated_players
  has_many :teams, through: :affiliated_players
  accepts_nested_attributes_for :affiliated_players, allow_destroy: true
  #試合には複数の選手が出場し、選手は複数の試合に出場します。
  has_many :competitors
  has_many :matches, through: :competitors
  accepts_nested_attributes_for :competitors, allow_destroy: true

  validates :name, presence: true
  #誕生日から年齢を計算
  def age
    now = Date.today
    date_format = "%Y%m%d"
    (now.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

end
