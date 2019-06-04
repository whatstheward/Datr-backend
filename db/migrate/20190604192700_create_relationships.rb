class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :partner, index: true
      t.boolean :confirmed
      t.timestamps null: false
    end
    add_foreign_key :relationships, :users, column: :partner_id
  end
end
