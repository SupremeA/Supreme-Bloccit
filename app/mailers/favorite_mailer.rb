class FavoriteMailer < ActionMailer::Base
  default from: "sales@rentplus.com"

  def new_comment(user, post, comment)

    # New Headers
    headers["Message-ID"] = "comments/#{comment.id}@supreme-bloccit.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@supreme-bloccit.com>"
    headers["References"] = "<post/#{post.id}@supreme-bloccit.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
