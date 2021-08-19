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
Like.delete_all
Comment.delete_all
Post.delete_all

first_name = %w[toby ybot user tots jonas]
last_name = %w[oby bot ser ots onas]
email = ['toby@example.com', 'ybot@example.com', 'user@example.com', 'tots@example.com', 'jonas@example.com']
post_title = ['Hello World!', 'Hello Ruby!', 'Hello Rails!', 'Hello Ruby on Rails!']

# create user
first_name.each_with_index do |_f, index|
  User.create(first_name: first_name[index - 1],
              last_name: last_name[index - 1],
              email: email[index - 1],
              password: '123456').save
end

user = User.all
post = Post.all

# create friendships, likes, posts, comments to test associations
user.each do |u|
  random_user = user.sample

  random_user = user.sample until random_user.first_name != u.first_name
  u.friendships.build(friend_id: random_user.id, accepted_request: false).save

  u.posts.build(title: post_title.sample, body: ('a'..'z').to_a.sample(100).join).save
  # this creates comments after a post but it should have its own loop
  # therefore more posts are created to comment on
  u.likes.build(user_id: user.sample.id, post_id: post.sample.id).save
  Comment.new(commenter_id: user.sample.id, body: ('a'..'z').to_a.sample(20).join, post_id: post.sample.id).save
end
