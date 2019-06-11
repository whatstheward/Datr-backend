class CreateDatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :date_partners do |t|
      t.belongs_to :user_date
      t.belongs_to :user
      t.timestamps
    end
  end
end
