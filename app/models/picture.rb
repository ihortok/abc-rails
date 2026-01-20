class Picture < ApplicationRecord
  # associations
  has_and_belongs_to_many :words

  # validations
  validates :title, presence: true
  validate :picture_file_presence

  # callbacks
  before_validation :add_default_title, on: :create

  has_one_attached :picture_file

  def add_default_title
    return if picture_file.blank?
    return if title.present?

    self.title = picture_file.filename.base
  end

  private

  def picture_file_presence
    errors.add(:picture_file, "must be attached") unless picture_file.attached?
  end
end
