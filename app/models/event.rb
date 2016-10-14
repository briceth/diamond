class Event < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  belongs_to :eventable, polymorphic: true
end
