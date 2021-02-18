module ApplicationHelper
  # Get's user's uploaded avatar if they have one
  # If not, try to grab their gravatar
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      gravatar_image_url(user.email, size: 200)
    end
  end
end
