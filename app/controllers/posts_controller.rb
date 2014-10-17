class PostsController < ApplicationController
  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

     def create
     @post = current_user.posts.build(params.require(:post).permit(:title, :body))
      authorize @post
     if @post.save
       flash[:notice] = "POW! That awesome post was saved."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. It was you not me, so Please try again."
       render :new
     end
   end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
     @post = Post.find(params[:id])
     authorize @post
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Ok! That post was good so I updated it for you."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. So keep tryin'."
       render :edit
     end
   end
end
