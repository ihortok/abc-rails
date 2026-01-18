class Color < ApplicationRecord
  # associations
  has_many :color_words, dependent: :destroy
  has_many :words, through: :color_words
end
