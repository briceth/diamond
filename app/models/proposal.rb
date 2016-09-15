class Proposal < ApplicationRecord
  belongs_to :activity

  acts_as_votable
end
