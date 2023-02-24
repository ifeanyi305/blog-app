class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def post_counter
    author.increment!(:post_counter)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'must be an integer greater than or equal to zero.' }
  validates :likes_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'must be an integer greater than or equal to zero.' }
end
