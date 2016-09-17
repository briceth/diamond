class User < ApplicationRecord
  has_many :meetings
  has_many :activities, through: :meetings
  has_many :notifications, as: :recipient
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
