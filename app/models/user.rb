class User < ApplicationRecord
    has_many :relationships, dependent: :destroy
    has_many :partners, :through => :relationships
    validates :username, :email, uniqueness: true
end
