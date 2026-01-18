class Alphabet < ApplicationRecord
  # associations
  has_many :letters, dependent: :destroy
  has_many :words, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true
end
