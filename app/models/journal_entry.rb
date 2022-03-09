class JournalEntry < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :title, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
