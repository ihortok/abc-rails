class Alphabet < ApplicationRecord
  # associations
  has_many :letters, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true
end
