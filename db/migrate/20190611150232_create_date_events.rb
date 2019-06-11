class CreateDateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :date_events do |t|
      t.belongs_to :user_date
      t.string :name
      t.string :location
      t.string :time
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :price
      t.timestamps
    end
  end
end
