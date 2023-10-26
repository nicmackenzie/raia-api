class PetitionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user, :petition_count,:topic,:target_signature,:petition_poster, :created_at
  belongs_to :user,serializer: ReviewUserSerializer
  has_many :petition_signatures, serializer: PetitionSignatureSerializer

  def petition_count
    object.petition_signatures.count
  end

end
