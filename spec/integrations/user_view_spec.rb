require 'rails_helper'

RSpec.describe 'User view', type: feature do
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
  end

  describe 'Index page' do
    before(:each) do
      visit '/users'
    end

    it 'should show all users name' do
      expect(page).to have_content(@user.name)
    end

    it 'should display image' do
      expect(page).to have_selector("img[src='#{@user.photo}']")
    end

    it 'should display the number of posts' do
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it 'should redirect to user show page' do
      click_link 'Enoque'

      expect(page).to have_current_path "/users/#{@user.id}"
    end
  end

  describe 'Show page' do
    before(:each) do
      visit "/users/#{@user.id}"
    end

    it 'should show users profile pic' do
      expect(page).to have_selector("img[src='#{@user.photo}']")
    end

    it 'should show users name' do
      expect(page).to have_content(@user.name)
    end

    it 'should display the number of posts' do
      expect(page).to have_content("Number of posts: #{@user.post_counter}")
    end

    it 'should display post title' do
      expect(page).to have_content(@post.title)
    end

    it 'should display user bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'should display first 3 posts' do
      expect(page).to have_content(@post.text)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content(@post3.text)
      expect(page).not_to have_content(@post4.text)
    end

    it 'should display all users posts when clicking See all posts' do
      visit "/users/#{@user.id}/posts"

      expect(page).to have_content(@post.text)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content(@post3.text)
      expect(page).to have_content(@post4.text)
    end

    it 'should redirect to clicked post' do
      click_link 'Post title number 1'

      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post.id}")
    end

    it 'should redirect to users posts index page' do
      click_link 'See all posts'

      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end
  end
end
