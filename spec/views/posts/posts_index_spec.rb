require 'rails_helper'

RSpec.describe 'User', type: :system do
  before :each do
    @user = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                        bio: 'Teacher in South Africa')
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    @comment = Comment.create(post: @first_post, author: @user, text: 'Hi Tom!')
  end
  describe 'Post page' do
    it "shows the user's profile" do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_css("img[src*='https://randomuser.me/api/portraits/men/1.jpg']")
    end
    it "shows the user's username" do
      user_name = Post.find_by(author: @user.name)
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content(user_name)
    end
    it 'shows the number of post' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content(@user.post_counter)
    end
    it 'shows the title of the post' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content('Hello')
    end
    it 'shows the body of the post' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content('This is my first post')
    end
    it 'shows the first comment of the post' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content(@comment.text)
    end
    it 'shows the number of likes && comments of the post' do
      visit "/users/#{@user.id}/posts"
      user_post = @user.posts.find_by(id: @first_post.id)
      expect(page).to have_content(user_post.comments.count)
      expect(page).to have_content(user_post.likes.count)
    end
    it 'redirects me to post show page when I click on a post' do
      link = @first_post.title
      visit "/users/#{@user.id}/posts"
      click_link link
      expect(page).to have_current_path(user_post_path(@user.id, @first_post.id))
    end
  end
end
