class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments

    @comment = current_user.comments.build( params_comment )
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Your comment was saved! Awesome!"
    else
      flash[:error] = "Your comment didn't save"
  end

  respond_with(@comment) do |format|
    format.html { redirect_to [@post.topic, @post] }
  end
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
