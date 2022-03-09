json.extract! journal_entry, :id, :user_id, :place_id, :title, :date, :description, :image, :created_at, :updated_at
json.url journal_entry_url(journal_entry, format: :json)
