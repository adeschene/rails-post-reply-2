class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    # If the parameter :user_topics is passed, display only the user's posted topics
    # otherwise, display all topics (default)
    @topics = params[:user_topics] ? current_user.topics.order(created_at: :desc) : Topic.all.order(created_at: :desc)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      redirect_to @topic, notice: "Topic successfully created!"
    else
      redirect_to topics_path, alert: "Invalid input, topic creation failed..."
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
