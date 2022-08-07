class AuthorSerializer < ActiveModel::Serializer
  attributes :name
  has_one :profile, serializer: ProfileSummarySerializer
  has_many :posts

end
