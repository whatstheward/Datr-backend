class Relationship < ApplicationRecord
    belongs_to :user
    belongs_to :partner, :class_name => "User"
    has_many :date_partners


    def create_inverse
        self.class.create(user_id:self.partner.id, partner_id: self.user.id)
    end

    validates :confirmed, numericality: {only_integer: true, less_than: 5, greater_than: -1}
    validates_uniqueness_of :user_id, scope: :partner_id
end
