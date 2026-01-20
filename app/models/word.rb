class Word < ApplicationRecord
  # associations
  belongs_to :alphabet
  belongs_to :color, optional: true
  has_and_belongs_to_many :pictures

  # validations
  validates :content, presence: true

  # scopes
  scope :starting_with, ->(letter) { where("content LIKE ?", "#{letter.upcase}%") }

  # callbacks
  before_save :titleize_content

  def starting_letter
    return nil if content.blank?

    content[0]
  end

  def picture_attached?
    pictures.first&.picture_file&.attached?
  end

  def picture
    pictures.first&.picture_file
  end

  private

  def titleize_content
    self.content = content.titleize
  end
end
