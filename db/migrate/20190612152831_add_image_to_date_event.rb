class AddImageToDateEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :date_events, :image_url, :string
  end
end
