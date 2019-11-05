class AddRatingToUserDate < ActiveRecord::Migration[5.2]
  def change
    add_column :user_dates, :rating, :integer
  end
end
