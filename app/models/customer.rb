class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #フォロー・フォロワー機能
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_customer, through: :follower, source: :followed
  has_many :follower_customer, through: :followed, source: :follower
  #ユーザーのフォローをする
  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end
  # ユーザーのフォローを外す
  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end
  # フォローしていればtrueを返す
  def following?(customer)
    following_customer.include?(customer)
  end
  #いいね・悪いね機能
  has_many :favorites, dependent: :destroy
  has_many :unfavorites, dependent: :destroy
  
  has_many:scoring_comments, dependent: :destroy

  validates :name, presence: true

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
