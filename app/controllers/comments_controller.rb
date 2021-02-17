class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(comment_params)
    if @comment.valid?
      redirect_to topic_path(@topic), notice: "Comment successfully created!"
    else
      redirect_to topic_path(@topic), alert: "Error: Must provide body text..."
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to topic_path(@topic), notice: "Comment successfully deleted!"
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :topic_id, :user_id)
    end
end
