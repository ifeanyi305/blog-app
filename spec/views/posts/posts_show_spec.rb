require 'rails_helper'

RSpec.describe 'User', type: :system do
  before :each do
    @user = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg', bio: 'Teacher in South Africa')
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    @comment = Comment.create(post: @first_post, author: @user, text: 'Hi Tom!' )
  end
  it "shows the title of the post" do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content("Hello")
  end
  it "shows who wrote the post" do
    user_name = Post.find_by(author: @user.name)
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(user_name)
  end
  it "shows the number of likes and comments of the post" do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    user_post = @user.posts.find_by(id: @first_post.id)
    expect(page).to have_content(user_post.comments.count)
    expect(page).to have_content(user_post.likes.count)
  end
  it "shows the post body" do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.text)
  end
  it "shows the username of each commentor" do
    commentor_name = Comment.find_by(author: @user.name)
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(commentor_name)
  end
  it "shows the comment a commentor left" do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@comment.text)
  end
end
