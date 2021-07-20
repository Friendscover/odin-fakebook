class Friendship < ApplicationRecord
  validates :accepted_request, inclusion: [true, false]

  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'user_id', inverse_of: :friendships
end
