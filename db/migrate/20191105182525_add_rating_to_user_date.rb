class AddRatingToUserDate < ActiveRecord::Migration[5.2]
  def up
    add_column :user_dates, :rating, :integer, :default => 0
  end
  def down
    remove_column :user_dates, :rating
  end
end
