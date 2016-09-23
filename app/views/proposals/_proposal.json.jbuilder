json.extract! proposal, :subject, :content, :location, :price, :url, :id, :activity_id


json.up_votes proposal.votes_for.count

if user_signed_in?
  json.up_voted current_user.voted_for? proposal
end


# {
#   "subject": "the  subject",
#   "content": "the content",
#   "location": "the location",
#   "price": price,
#   "url": "http//..."
#     user: {
#       "email": "bth@gmail.com",
#       "avatar_url": "http//..."
#     }
#     "up_votes": 3,
#     "up_voted": true ou false
# }
