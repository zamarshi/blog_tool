class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favouriters, through: :favourites, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: true, length: { minimum: 7 }

  validates :body, presence: true

  def self.search(search)
    where("title ILIKE ? OR body ILIKE ?", "%#{search}%", "%#{search}%")
  end

  def body_snippet
    if body.size > 100
      body.slice(0..96) + "..."
    end
  end

  def user_full_name
    if user.present?
      user.full_name
    else
      'Anonymous'
    end
  end

end
