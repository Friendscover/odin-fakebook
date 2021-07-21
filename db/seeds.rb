# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.all
first = User.first.id
second = User.second.id

user.each do |u|
  u.friendships.build(friend_id: first, accepted_request: false).save
  u.friendships.build(friend_id: second, accepted_request: true).save
end