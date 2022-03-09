class JournalEntryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :place_id, :integer
  attribute :title, :string
  attribute :date, :date
  attribute :description, :string
  attribute :image, :string

  # Direct associations

  # Indirect associations

end
