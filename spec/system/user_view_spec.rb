require 'rails_helper'

RSpec.describe 'User view', type:feature do

    before(:each) do
        @user = User.create(name: 'Enoque', photo:'example.jpg',  bio: 'my bio', post_counter: 1)
        @post = Post.create(title: 'Post title', text: 'Post text', comments_counter: 1, likes_counter: 1, user_id: @user.id)
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

        it 'Should show users profile pic' do
            expect(page).to have_selector("img[src='#{@user.photo}']")
        end
    end
end