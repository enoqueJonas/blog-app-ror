require 'rails_helper'

RSpec.describe 'User view', type:feature do
    before do
        @user1 = User.create(name: 'Enoque', photo:'example.jpg' )
        @user2 = User.create(name: 'Ana')
        @user3 = User.create(name: 'Emidio')
    end
    describe 'Index page' do
        it 'should show all users name' do
            visit '/users'

            expect(page).to have_content(@user1.name)
            expect(page).to have_content(@user2.name)
            expect(page).to have_content(@user3.name)
        end

        it 'should display image' do
            visit '/users'

            expect(page).to have_selector("img[src='#{@user1.photo}']")
        end
    end
end