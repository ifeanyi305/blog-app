require 'rails_helper'

RSpec.describe 'index_show', type: :system do
  before :each do
    @user = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                        bio: 'Teacher in South Africa')
  end
  describe 'show page' do
    it 'shows the name and profile photo of a user' do
      user = User.find_by(photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80')
      visit "/users/#{user.id}"
      expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80']")
      expect(page).to have_content('joseph')
    end
    it 'displays the number of post for a user' do
      user = User.find_by(photo: 'https://avatars.githubusercontent.com/u/105528809?v=4')
      visit "/users/#{user.id}"
      expect(page).to have_content('5')
    end
    it 'show the bio of the user' do
      user = User.find_by(bio: 'Software engineer')
      visit "/users/#{user.id}"
      expect(page).to have_content('Software engineer')
    end

    it "shows the user's first 3 posts" do
      three_recent_post = @user.three_most_recent_post
      three_recent_post.each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it "redirects me to the post's show page when i click a user's post" do
      user = User.find_by(name: 'Ifeanyi')
      post = Post.find_by(title: 'bro')
      visit "/users/#{user.id}"
      click_on 'bro'
      expect(page).to have_current_path(user_post_path(user.id, post.id))
    end

    it "shows a button to view all of a user's posts" do
      user = User.find_by(name: 'Ifeanyi')
      visit "/users/#{user.id}"
      expect(page).to have_button('see all posts')
    end
  end
end
