class Letter < ApplicationRecord
  # associations
  belongs_to :alphabet

  # validations
  validates :character, presence: true, uniqueness: { scope: :alphabet_id }
end
