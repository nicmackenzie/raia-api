class PetitionSignatureSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :reason_for_signing, :user

  def user
    {
      id: object.user.id,
      username: object.user.username,
      full_name: object.user.full_name,
      profile_image: object.user.profile_image
    }
  end
end
