json.proposals do
  json.array! @proposals do |proposal|
    json.partial! "proposals/proposal", proposal: proposal
  end
end

# {
#   "products": [
#       {
#     "subject": "the  subject",
#     "content": "the content",
#     "location": "the location",
#     "price": price,
#     "url": "http//..."
#       user: {
#         "email": "bth@gmail.com",
#         "avatar_url": "http//..."
#       }
#       "up_votes": 3,
#       "up_voted": true ou false
#    }
#   ]
# }
