class Letter < ApplicationRecord
  default_scope { order(:position) }

  # associations
  belongs_to :alphabet

  # validations
  validates :character, presence: true, uniqueness: { scope: :alphabet_id }
  validates :position, presence: true, numericality: { only_integer: true, greater_than: 0 }

  has_one_attached :sound
end
