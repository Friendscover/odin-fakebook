class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :friendships, inverse_of: :user, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts
  has_many :comments
  has_many :likes

  has_one_attached :avatar
  # @book = @author.books.build(published_at: Time.now,
  # book_number: "A12345")
end
