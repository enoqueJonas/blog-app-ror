class Post < ApplicationRecord
    has_many :likes
    has_many :comments
    belongs_to :user

    def post_counter
       user.update(post_counter: user.posts.count) 
    end

    def recent_comments
        comments.order(created_at: :desc).limit(5)
    end
end