class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
      @posts = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Alright, I was able to successfully save your topic."
    else
      flash[:error] = "I can't save that topic. You gotta try again!"
      render :new
    end
end

def update
  @topic = Topic.find(params[:id])
  authorize @topic
  if @topic.update_attributes(topic_params)
    redirect_to @topic
  else
    flash[:error] = "You gotta try again, I can't save that topic like that!"
    render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end
end