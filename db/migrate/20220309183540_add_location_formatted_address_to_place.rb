class AddLocationFormattedAddressToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :location_formatted_address, :string
  end
end
