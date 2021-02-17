class PagesController < ApplicationController
  def home
    @recent_topics  = Topic.all.order(created_at: :desc).first(10)
    @user_topics    = current_user.topics.order(created_at: :desc).limit(10)
  end
end
