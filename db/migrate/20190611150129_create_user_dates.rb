class CreateUserDates < ActiveRecord::Migration[5.2]
  def change
    create_table :user_dates do |t|
        t.belongs_to :user
        t.string :day
        t.string :time
      t.timestamps
    end
  end
end
