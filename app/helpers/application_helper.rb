module ApplicationHelper
  # Get's user's uploaded avatar if they have one
  # If not, try to grab their gravatar
  # If they don't have a gravatar, show a custom default image
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      gravatar_image_url(user.email, size: 200, d: 'https://custom-default-image.s3-us-west-2.amazonaws.com/no_image.jpg')
    end
  end
end
