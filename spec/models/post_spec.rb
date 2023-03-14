require 'rails_helper'
require 'securerandom'

RSpec.describe Post, type: :model do
  subject = Post.new(title: 'Hello', text: 'This is my first post')

  before { subject.save }

  it 'Title must not be blank' do
    subject.title = nil

    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.title = SecureRandom.hex(251).unpack1('a*')[0, 251]

    expect(subject).to_not be_valid
  end

  context 'Comments counter' do
    it 'Cannot be less than zero' do
      subject.comments_counter = -2

      expect(subject).to_not be_valid
    end

    it 'Has to be an integer' do
      subject.comments_counter = 6.5

      expect(subject).to_not be_valid
    end

    context 'Likes counter' do
      it 'Cannot be less than zero' do
        subject.likes_counter = -2

        expect(subject).to_not be_valid
      end

      it 'Has to be an integer' do
        subject.likes_counter = 6.5

        expect(subject).to_not be_valid
      end
    end
  end
end
