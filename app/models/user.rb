class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :friendships, inverse_of: :user, dependent: :destroy
  has_many :friends, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  # @book = @author.books.build(published_at: Time.now,
  # book_number: "A12345")
end
