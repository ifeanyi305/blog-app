require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Test User', photo: 'test@example.com', bio: 'password') }
  let(:post) { Post.new(title: 'Test Post', text: 'Test content', author: user) }

  describe '#post_counter' do
    it 'increments the author post counter' do
      expect { post.post_counter }.to change { user.reload.post_counter }.by(1)
    end
  end

  describe '#five_most_recent_comments' do
    it 'returns the 5 most recent comments' do
      comments = post.five_most_recent_comments
      expect(comments).to eq(post.comments.order(created_at: :desc).limit(5))
    end
  end

  describe 'validations' do
    it 'requires a title' do
      post.title = ''
      expect(post).to_not be_valid
    end

    it 'requires title to be no more than 250 characters' do
      post.title = 'a' * 251
      expect(post).to_not be_valid
    end

    it 'requires comments_counter to be an integer greater than or equal to 0' do
      post.comments_counter = -1
      expect(post).to_not be_valid
    end

    it 'requires likes_counter to be an integer greater than or equal to 0' do
      post.likes_counter = -1
      expect(post).to_not be_valid
    end
  end
end
