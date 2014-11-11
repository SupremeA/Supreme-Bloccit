class FavoritesController < ApplicationController

  def create

    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite

    if favorite.save
      flash[:notice] = "We will let you know when this updates!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Something went wrong, try that again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy

    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite

    if favorite.destroy
      flash[:success] = "You have removed this from your favorites"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "This favorite has not been removed, please try again."
      redirect_to [@post.topic, @post]
    end
  end

end
