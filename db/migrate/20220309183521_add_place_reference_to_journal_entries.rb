class AddPlaceReferenceToJournalEntries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :journal_entries, :places
    add_index :journal_entries, :place_id
    change_column_null :journal_entries, :place_id, false
  end
end
