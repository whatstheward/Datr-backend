class UserDate < ApplicationRecord
    has_many :date_events, dependent: :destroy
    has_many :date_partners, dependent: :destroy
    belongs_to :user
end
