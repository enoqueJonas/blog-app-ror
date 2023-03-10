class Post < ApplicationRecord
    has_many :like 
    has_many :comment 
    belongs_to :user, foreign_key: "users_id" 
end