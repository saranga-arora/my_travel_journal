class PlaceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :location, :string

  # Direct associations

  has_many   :journal_entries

  # Indirect associations

  many_to_many :users

end
