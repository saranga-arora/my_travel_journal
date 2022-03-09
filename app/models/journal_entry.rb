class JournalEntry < ApplicationRecord
  # Direct associations

  belongs_to :place

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :date, :presence => true

  validates :place_id, :presence => true

  validates :title, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
