class AddLocationLatitudeToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :location_latitude, :float
  end
end
