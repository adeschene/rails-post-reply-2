class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      redirect_to root_path, notice: "Topic successfully created!"
    else
      redirect_to root_path, alert: "Invalid input, topic creation failed..."
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: "Topic successfully updated!"
    else
      flash.now[:alert] = "Invalid input, topic update failed..."
      render :edit
    end
  end

  def destroy
    @topic.destroy

    redirect_to root_path, notice: "Topic successfully deleted!"
  end

  private
    def set_topic
      @topic = current_user.topics.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :description, :user_id)
    end
end
