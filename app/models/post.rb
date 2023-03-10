class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :post_counter

  private

  def post_counter
    user.update(post_counter: user.posts.count)
  end
end
