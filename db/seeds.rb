Proposal.delete_all
User.delete_all
Activity.delete_all

password = "passwordpassword"

20.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = password
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.avatar = Faker::Avatar.image("my-own-slug", "50x50")
  puts "Welcome " + user.first_name if user.save
end

categories = ['sports', 'open', 'restaurant', 'theatre', 'exposition', 'concert', 'coffee', 'cinema']

categories.each do |category|
  activities = Activity.new
  activities.category = category
  puts "welcome " + activities.category if activities.save
end



20.times do
  proposal = Proposal.new
  proposal.subject = Faker::Lorem.word
  proposal.content = Faker::Lorem.sentence
  proposal.location = Faker::Address.street_address
  proposal.price = Faker::Number.number(2)
  proposal.activity_id = Faker::Number.between(1, 8)
  puts "welcome " + proposal.subject if proposal.save
end
