class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :post_counter, numericality: {greater_than: 0, only_integer: true} 

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
