class Team < ApplicationRecord
  has_many :participating_teams, dependent: :destroy
  has_many :affiliated_players, dependent: :destroy
  #試合でチームはホームチームとアウェイチームに分かれます。
  has_many :home_team, class_name: "Match", foreign_key: "home_team_id", dependent: :destroy
  has_many :away_team, class_name: "Match", foreign_key: "away_team_id", dependent: :destroy
  #チームは複数の選手が所属しますが、選手は複数のチームに所属する可能性があります。
  has_many :affiliated_players
  has_many :players, through: :affiliated_players
  accepts_nested_attributes_for :affiliated_players, allow_destroy: true

  validates :name, presence: true
  validates :abbreviation, presence: true

  has_one_attached :team_image

  def get_team_image(width, height)
    unless team_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
     team_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    team_image.variant(resize_to_limit: [width, height]).processed
  end

end
