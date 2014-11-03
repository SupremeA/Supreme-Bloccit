class Vote < ActiveRecord::Base
belongs_to :post
  belongs_to :user

#  validates :post_id, presence: true
#  validates :user_id, presence: true
#  validates :string, (+1 || -1)
validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

after_save :update_post

private

  def update_post
    post.update_rank
  end
end
