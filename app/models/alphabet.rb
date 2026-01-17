class Alphabet < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true
end
