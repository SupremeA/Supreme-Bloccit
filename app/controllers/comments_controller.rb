class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params_comment)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to [@post.topic, @post], notice: "Your comment was saved! Awesome!"
    else
      redirect_to [@post.topic, @post], notice: "Your comment didnt save"
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."

    else
      flash[:error] = "Comment was not deleted, please try again!"

    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end
end

private

 def params_comment
   params.require(:comment).permit(:body)
 end

 end
