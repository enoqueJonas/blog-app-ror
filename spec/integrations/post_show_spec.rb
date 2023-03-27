require 'rails_helper'

RSpec.describe 'PostIndex', type: :feature do
  describe 'post show page' do
    before(:each) do
      @user = User.create(name: 'Enoque', photo: 'example.jpg', bio: 'my bio', post_counter: 4)
      @post = Post.create(title: 'Post title number 1', text: 'Post text', comments_counter: 1, likes_counter: 1,
                          user_id: @user.id)
      @post2 = Post.create(title: 'Post title 2', text: 'Post text 2', comments_counter: 1, likes_counter: 1,
                           user_id: @user.id)
      @post3 = Post.create(title: 'Post title 3', text: 'Post text 3', comments_counter: 1, likes_counter: 1,
                           user_id: @user.id)
      @post4 = Post.create(title: 'Post title 4', text: 'Post text 4', comments_counter: 1, likes_counter: 1,
                           user_id: @user.id)
      @comment = Comment.create(text: 'Comment text', user_id: @user.id, post_id: @post.id)
      Like.create(user_id: @user.id, post_id: @post.id)
      visit "users/#{@user.id}/posts"
    end

    it 'should contain the post title' do
      expect(page).to have_content(@post.title.to_s)
    end

    it 'should contain the post author' do
      expect(page).to have_content(@user.name.to_s)
    end

    it 'should contain the comments counter' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end

    it 'should contain the likes counter' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    it 'should contain the post body' do
      expect(page).to have_content(@post.text.to_s)
    end

    it 'should contain the user name of each commentor' do
      expect(page).to have_content('Enoque')
    end
    it 'should contain the comment text' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Comment text')
    end
  end
end
