class RemoveConfirmedFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :confirmed
    add_column :relationships, :confirmed, :integer
  end
end
