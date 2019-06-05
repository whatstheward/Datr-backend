class User < ApplicationRecord
    has_many :relationships, dependent: :destroy
    has_many :partners, :through => :relationships
    has_many :user_genders
    has_many :genders, through: :user_genders
    has_many :user_pronouns
    has_many :pronouns, through: :user_pronouns
    has_many :user_orientations
    has_many :orientations, through: :user_orientations
    validates :username, :email, uniqueness: true

    # build json render functions

end
