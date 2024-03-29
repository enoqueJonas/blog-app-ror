require 'rails_helper'

RSpec.describe User, type: :model do
  subject = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post counter should be >= 0' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end
end
