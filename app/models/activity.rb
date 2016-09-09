class Activity < ApplicationRecord
  has_many :meetings
  has_many :proposals
end
