class CommentsController < ApplicationController
  def create
    @comment = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.topic = @comment
     authorize @comment
  end
end
