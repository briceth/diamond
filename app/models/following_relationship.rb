class FollowingRelationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed_user, class_name: 'User'
  #il va chercher un follower model et followed_user model
  #alors qu'on veut le model user, donc on le specifie
  validates :follower_id, presence: true
  validates :followed_user_id, presence: true
end
