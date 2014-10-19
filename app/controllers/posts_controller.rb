class PostsController < ApplicationController

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

     def create
     @topic = Topic.find(params[:topic_id])
     @post = current_user.posts.build(params.require(:post).permit(:title, :body))
     @post.topic = @topic
      authorize @post

     if @post.save
       flash[:notice] = "POW! That awesome post was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. It was you not me, so Please try again."
       render :new
     end
   end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post

     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Ok! That post was good so I updated it for you."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. So keep tryin'."
       render :new
     end
   end
end
