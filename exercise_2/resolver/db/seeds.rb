# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: Faker::Name.name.downcase.gsub("'", '').split(' ').join('-'), email: Faker::Internet.email)

99.times do |n|
  username  = Faker::Name.name.downcase.gsub("'", '').split(' ').join('-')
  email = "#{username}-#{n+1}@example.com"
  User.create!(username: username, email: email)
end

# Relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]

following.each { |followed| RelationshipService.follow(user, followed) }
followers.each { |follower| RelationshipService.follow(follower, user) }
