class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user_id, presence: true

  #after_create :send_favorite_emails

    private

  def send_favorite_emails
    post.favorites.each do |favorite|
      if favorite.user.present?
        FavoriteMailer.new_comment(favorite.user, topic.post, self).deliver
      end
    end
  end
end
