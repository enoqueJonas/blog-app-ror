require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  it 'displays usernames, profile pictures, and post count for each user' do
    first_user = User.create(name: 'Jose', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.')
    post1 = Post.create(title: 'Post title number 1', text: 'Post text', comments_counter: 1, likes_counter: 1,
                        user_id: first_user.id)
    comment = Comment.create(text: 'Comment text', user_id: first_user.id, post_id: post1.id)

    visit "/users/#{first_user.id}/posts"
    expect(page).to have_content(first_user.name)
    expect(page).to have_css("img[src='#{first_user.photo}']")
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content(post1.text)
    expect(page).to have_content(comment.text)
    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 1')
    expect(page).to have_content('Pagination')
    click_on 'Post title'
    expect(current_path).to eq("/users/#{first_user.id}/posts/#{post1.id}")
  end
end
