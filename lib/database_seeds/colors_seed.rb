module DatabaseSeeds
  class ColorsSeed
    COLORS = {
      "Red" => "#FF0000",
      "Green" => "#00FF00",
      "Blue" => "#0000FF",
      "Yellow" => "#FFFF00",
      "Black" => "#000000",
      "Sky Blue" => "#87CEEB",
      "White" => "#FFFFFF",
      "Orange" => "#FFA500",
      "Purple" => "#800080",
      "Pink" => "#FFC0CB",
      "Brown" => "#A52A2A",
      "Gray" => "#808080"
    }.freeze

    def run
      COLORS.each do |name, code|
        Color.find_or_create_by(name: name, code: code)
      end
    end
  end
end
