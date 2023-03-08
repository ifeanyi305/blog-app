require 'rails_helper'

RSpec.describe 'User', type: :system do
  @users = User.all
  describe 'index page' do
    it 'shows the username' do
      visit users_path
      expect(page).to have_content('joseph')
    end
    it 'should show the user photo' do
      visit users_path
      expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/105528809?v=4']")
    end
    it 'counts the number of post' do
      visit users_path
      expect(page).to have_content('5')
    end
    it 'redirects to the users show page when i click on the username' do
      user = User.find_by(name: 'joseph')
      visit users_path
      click_on "joseph"
      expect(page).to have_current_path("/users/#{user.id}")
    end
  end
end
