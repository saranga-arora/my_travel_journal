class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :journal_entries,
             dependent: :destroy

  # Indirect associations

  has_many   :places,
             through: :journal_entries,
             source: :place

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
