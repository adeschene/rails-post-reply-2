module ApplicationHelper
  def user_avatar(user, size=100)
    if user.avatar.attached?
      user.avatar
    else
      'default_avatar'
    end
  end
end
