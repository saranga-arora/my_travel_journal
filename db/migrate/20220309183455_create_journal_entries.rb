class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.integer :user_id
      t.integer :place_id
      t.string :title
      t.date :date
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
