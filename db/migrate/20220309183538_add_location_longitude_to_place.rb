class AddLocationLongitudeToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :location_longitude, :float
  end
end
