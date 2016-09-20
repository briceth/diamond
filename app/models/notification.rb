class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: "User" #recipient est dans la Class User
  belongs_to :notifiable, polymorphic: true
end
