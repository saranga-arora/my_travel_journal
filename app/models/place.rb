class Place < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
