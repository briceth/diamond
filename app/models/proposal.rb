class Proposal < ApplicationRecord
  attr_reader :subject

  belongs_to :activity
  belongs_to :user
  has_many :events

  acts_as_votable

  searchkick text_start: [:subject], suggest: [:subject]

  def search_data
    {
      subject: subject,
      location: location
    }
  end

end
