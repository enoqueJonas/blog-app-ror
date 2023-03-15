require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:example) { get users_path }

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end

  it "renders 'index' template" do
    expect(response).to render_template('index')
  end

  it 'shows correct boby placeholder text' do
    expect(response.body).to include 'This Will display all users'
  end
end

RSpec.describe 'Posts', type: :request do
  before(:example) { get user_posts_url(user_id: 1) }

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end

  it "renders 'index' template" do
    expect(response).to render_template('index')
  end

  it 'shows correct body placeholder text' do
    expect(response.body).to include 'This Will show all posts'
  end
end
