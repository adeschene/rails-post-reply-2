class PagesController < ApplicationController
  def home
    # Gives access to the latest 10 topics posted on site
    @recent_topics = Topic.all.order(created_at: :desc).first(10)
    # Gives us access to the user's 10 most recent posted topics
    @user_topics   = current_user.topics.order(created_at: :desc).limit(10) if user_signed_in?
  end
end
