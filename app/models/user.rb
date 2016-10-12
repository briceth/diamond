class User < ApplicationRecord
  has_attachment :photo
  has_many :meetings
  has_many :activities, through: :meetings
  has_many :proposals
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

  devise :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end


  def following? user
    followed_user_ids.include? user.id
  end

  def follow user
    followed_users << user
  end

  def unfollow user
    followed_users.delete(user)
  end

  def can_follow? user
    self != user
  end

  def can_upload? user
    self == user
  end
end

  # def self.populate_picture!
  #   all.each do |user|
  #     avatar = JSON.load(open('http://uifaces.com/api/v1/random'))['image_urls']['epic']
  #     user.picture = avatar
  #     user.save
  #     puts user.picture
  #   end
  # end










