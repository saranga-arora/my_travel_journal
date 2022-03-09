class Place < ApplicationRecord
  # Direct associations

  has_many   :journal_entries,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
