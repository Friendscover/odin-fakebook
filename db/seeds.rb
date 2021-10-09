# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating random data. Please hold the line.'

## drop table to before seeding new items
User.delete_all
Friendship.delete_all
Like.delete_all
Comment.delete_all
Post.delete_all

first_name = %w[toby ybot user tots jonas obas enos random hes dont]
last_name = %w[oby bot ser ots onas bas nos andom esss ont]
# create user
first_name.each_with_index do |_f, index|
  User.create(first_name: first_name[index - 1],
              last_name: last_name[index - 1],
              email: "#{first_name[index - 1]}@example.com",
              password: '123456').save
end

user = User.all
post = Post.all

# create 100 Posts
100.times do
  random_user = user.sample

  random_user.posts.build(title: ('a'..'z').to_a.sample(50).join, body: ('a'..'z').to_a.sample(1000).join).save
end

# create 10000 comments on random posts
10_000.times do
  random_post = post.sample

  random_post.comments.build(commenter_id: user.sample.id, body: ('a'..'z').to_a.sample(50).join, post_id: post.sample.id).save
end

# create friendships, likes, posts, comments to test associations
user.each do |u|
  random_user = user.sample

  random_user = user.sample until random_user.first_name != u.first_name
  u.friendships.build(friend_id: random_user.id, accepted_request: false).save

  # this creates comments after a post but it should have its own loop
  # therefore more posts are created to comment on
  u.likes.build(user_id: user.sample.id, post_id: post.sample.id).save
end
