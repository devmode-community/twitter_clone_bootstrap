class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :username, presence: true, length: { maximum: 20 }

  def feed
    Tweet.where(user_id: followed_users.pluck(:id).push(id)).order(created_at: :desc)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def picture
    "https://picsum.photos/100/100/?random"
  end
end
