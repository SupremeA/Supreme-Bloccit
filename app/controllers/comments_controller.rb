class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(params_comment)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to (@topic, @post)notice "Your comment was saved! Awesome!"
    else
      redirect_to (@topic, @post) notice "Your comment didnt save"
  end
end

private

 def params_comment
   params.require(:comment).permit(:body)
 end

 end
