class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
