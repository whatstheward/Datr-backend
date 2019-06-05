class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  has_many :genders
  has_many :pronouns
  has_many :orientations
end
