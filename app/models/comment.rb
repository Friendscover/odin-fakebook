class Comment < ApplicationRecord
  validates :body, presence: true, length: { minimum: 10 }

  belongs_to :commenter, class_name: 'User'
  belongs_to :post
end
