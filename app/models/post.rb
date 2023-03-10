class Post < ApplicationRecord
    has_many :like 
    has_many :comment 
    belongs_to :user 
end