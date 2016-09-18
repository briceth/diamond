class Proposal < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  acts_as_votable
end
