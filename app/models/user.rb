class User < ApplicationRecord

  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".strip.squeeze(' ').titleize
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: VALID_EMAIL_REGEX

end
