# john = User.create!(email: 'john@beatles.com', password: 'testtest')
# paul = User.create!(email: 'paul@beatles.com', password: 'testtest')
# ringo = User.create!(email: 'ringo@beatles.com', password: 'testtest', avatar_url: '')
# george = User.create!(email: 'george@beatles.com', password: 'testtest', avatar_url: '')

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
User.populate_picture!


