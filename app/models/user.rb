class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name  
      user.first_name = auth.info.last_na,e # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
