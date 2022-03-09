class AddUserReferenceToJournalEntries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :journal_entries, :users
    add_index :journal_entries, :user_id
    change_column_null :journal_entries, :user_id, false
  end
end
