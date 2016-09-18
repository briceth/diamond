class User < ApplicationRecord
  has_many :meetings
  has_many :activities, through: :meetings
  has_many :notifications, as: :recipient

  has_many :followed_user_relationships,
  foreign_key: :follower_id,
  class_name: 'FollowingRelationship',
  dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships, dependent: :destroy

  has_many :follower_relationships,
  foreign_key: :follower_user_id,
  class_name: 'FollowingRelationship',
  dependent: :destroy
  has_many :followers, through: :follower_relationships, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter

  # def self.populate_picture!
  #   all.each do |user|
  #     avatar = JSON.load(open('http://uifaces.com/api/v1/random'))['image_urls']['epic']
  #     user.picture = avatar
  #     user.save
  #     puts user.picture
  #   end
  # end
end
