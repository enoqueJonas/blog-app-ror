class User < ApplicationRecord
    has_many :posts, foreign_key: "posts_id"
    has_many :likes
    has_many :comment

    def recent_posts
        post.order(created_at: :desc).limit(3)
    end
end