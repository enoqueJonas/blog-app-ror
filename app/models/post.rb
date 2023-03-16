class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user

  validates :title, presence: true, length: { in: 1...250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    user.update(post_counter: user.posts.count)
  end
end

