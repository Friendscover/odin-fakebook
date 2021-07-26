# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## drop table to before seeding new items
User.delete_all
Friendship.delete_all

first_name = %w[toby ybot user tots jonas]
last_name = %w[oby bot ser ots onas]
email = ['toby@example.com', 'ybot@example.com', 'user@example.com', 'tots@example.com', 'jonas@example.com']

# create user
first_name.each_with_index do |_f, index|
  User.create(first_name: first_name[index - 1],
              last_name: last_name[index - 1],
              email: email[index - 1],
              password: '123456').save
end

user = User.all

# create friendships to test associations
user.each do |u|
  u.friendships.build(friend_id: user.sample.id, accepted_request: false).save
  u.friendships.build(friend_id: user.sample.id, accepted_request: true).save
end
