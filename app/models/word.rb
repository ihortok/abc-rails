class Word < ApplicationRecord
  # associations
  belongs_to :alphabet

  # validations
  validates :content, presence: true

  # scopes
  scope :starting_with, ->(letter) { where("content LIKE ?", "#{letter.upcase}%") }
end
