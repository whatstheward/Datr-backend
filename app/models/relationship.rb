class Relationship < ApplicationRecord
    belongs_to :user
    belongs_to :partner, :class_name => "User"

    after_create :create_inverse

    def create_inverse
        self.class.create(user_id:self.partner.id, partner_id: self.user.id)
    end

    validates_uniqueness_of :user_id, scope: :partner_id
end
