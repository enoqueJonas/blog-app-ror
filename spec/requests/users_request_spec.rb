require 'rails_helper.rb'

RSpec.describe "Users", type: :request do
    before (:example) { get users_path}
    
    it "is a success" do
        expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
        expect(response).to render_template('index')
    end

    it "shows correct boby placeholder text" do
        expect(response.body).to include "This Will display all users"
    end
end