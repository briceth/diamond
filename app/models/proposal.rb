class Proposal < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  acts_as_votable

  searchkick text_start: [:subject], suggest: [:subject]

  def search_data
    {
      subject: subject,
      location: location
    }
  end
end
