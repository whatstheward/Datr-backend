class User < ApplicationRecord
    has_secure_password
    has_many :relationships, dependent: :destroy
    has_many :partners, :through => :relationships, dependent: :destroy
    has_many :user_genders
    has_many :genders, through: :user_genders, dependent: :destroy
    has_many :user_pronouns
    has_many :pronouns, through: :user_pronouns, dependent: :destroy
    has_many :user_orientations
    has_many :orientations, through: :user_orientations, dependent: :destroy
    has_many :user_interests
    has_many :interests, through: :user_interests, dependent: :destroy
    has_many :user_dates
    has_many :date_partners, dependent: :destroy
    validates :username, :email, uniqueness: true
end
