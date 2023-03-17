class LikesController < ApplicationController
    def create
        @like = Like.new
    end
end