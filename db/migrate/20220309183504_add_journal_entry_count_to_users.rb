class AddJournalEntryCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :journal_entries_count, :integer
  end
end
