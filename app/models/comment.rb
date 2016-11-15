class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  def user_full_name
    if user.present?
      user.full_name
    else
      'Anonymous'
    end
  end
end
