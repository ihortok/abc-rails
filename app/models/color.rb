class Color < ApplicationRecord
  # associations
  has_many :color_words
  has_many :words, through: :color_words
end
