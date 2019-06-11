class UserDate < ApplicationRecord
    has_many :date_events
    has_many :date_partners
    belongs_to :user
end
