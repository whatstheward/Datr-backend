class UserPronoun < ApplicationRecord
    belongs_to :user
    belongs_to :pronoun
end
