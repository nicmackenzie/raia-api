class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :message, :user_from, :user_to, :redirect_url, :created_at, :status

  def user_from
    user = object.user_from
    return unless user

    {
      id: user.id,
      full_name: user.full_name,
      username: user.username,
      profile_image: user.profile_image
    }
  end

  def user_to
    user = object.user_to
    {
      id: user.id,
      full_name: user.full_name,
      username: user.username,
      profile_image: user.profile_image
    }
  end
end
