class Proposal < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  acts_as_votable

  searchkick text_start: [:subject]
end
