require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get('/users/show/posts') }
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders correct placeholder text' do
      expect(response.body).to include('Here is a list of all the posts from this user')
    end
  end
  describe 'GET /show/:id' do
    before(:example) { get('/users/show/posts/1') }
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders correct placeholder text' do
      expect(response.body).to include('below are details about this post from this user')
    end
  end
end
