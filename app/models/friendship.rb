class Friendship < ApplicationRecord
  validates :accepted_request, presence: true

  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: "user_id"
end
