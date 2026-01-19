class Word < ApplicationRecord
  # associations
  belongs_to :alphabet
  belongs_to :color, optional: true

  # validations
  validates :content, presence: true

  # scopes
  scope :starting_with, ->(letter) { where("content LIKE ?", "#{letter.upcase}%") }

  # callbacks
  before_save :titleize_content

  has_one_attached :image

  def starting_letter
    return nil if content.blank?

    content[0]
  end

  private

  def titleize_content
    self.content = content.titleize
  end
end
