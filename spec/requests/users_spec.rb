require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }
    it "it renders 'index' template" do
      expect(response).to render_template('index')
    end
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders correct placeholder text" do
      expect(response.body).to include("Here are the list of all users")
    end
  end
  describe 'GET /show' do
    before(:example) { get ('/users/show') }
    it "it renders 'show' template" do
      expect(response).to render_template('show')
    end
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders correct placeholder text" do
      expect(response.body).to include("Here are all the details about this user")
    end
  end
end
