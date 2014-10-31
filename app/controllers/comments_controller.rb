class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(params_comment)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to [@topic, @post], notice: "Your comment was saved! Awesome!"
    else
      redirect_to [@topic, @post], notice: "Your comment didnt save"
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment was not deleted, please try again!"
      redirect_to [@topic, @post]
    end
  end
end

private

 def params_comment
   params.require(:comment).permit(:body)
 end

 end