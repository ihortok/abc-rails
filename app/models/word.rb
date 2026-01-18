class Word < ApplicationRecord
  # associations
  belongs_to :alphabet
  has_many :color_words
  has_many :colors, through: :color_words

  # validations
  validates :content, presence: true

  # scopes
  scope :starting_with, ->(letter) { where("content LIKE ?", "#{letter.upcase}%") }

  has_one_attached :image
end
