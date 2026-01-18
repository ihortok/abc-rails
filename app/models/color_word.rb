class ColorWord < ApplicationRecord
  # associations
  belongs_to :color
  belongs_to :word
end
