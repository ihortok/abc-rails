module DatabaseSeeds
  class EnglishAlphabetSeed
    def run
      # Create or find the English alphabet
      alphabet = Alphabet.find_or_create_by(name: "English")

      # Create letters A-Z for the English alphabet
      ("A".."Z").to_a.each do |letter|
        alphabet.letters.find_or_create_by(character: letter)
      end

      # Create some words for each letter
      words = {
        "A" => [ "Apple", "Ant", "Arrow" ],
        "B" => [ "Ball", "Bat", "Bee" ],
        "C" => [ "Cat", "Car", "Cup" ],
        "D" => [ "Dog", "Door", "Duck" ],
        "E" => [ "Elephant", "Egg", "Eagle" ],
        "F" => [ "Fish", "Fan", "Frog" ],
        "G" => [ "Goat", "Gate", "Gum" ],
        "H" => [ "Hat", "Horse", "House" ],
        "I" => [ "Ice", "Igloo", "Insect" ],
        "J" => [ "Jar", "Jam", "Jacket" ],
        "K" => [ "Kite", "Key", "Kangaroo" ],
        "L" => [ "Lion", "Lamp", "Leaf" ],
        "M" => [ "Monkey", "Moon", "Map" ],
        "N" => [ "Nest", "Net", "Nose" ],
        "O" => [ "Owl", "Orange", "Ox" ],
        "P" => [ "Pig", "Pen", "Pineapple" ],
        "Q" => [ "Queen", "Quilt", "Quail" ],
        "R" => [ "Rat", "Ring", "Rocket" ],
        "S" => [ "Sun", "Star", "Snake" ],
        "T" => [ "Tiger", "Tree", "Table" ],
        "U" => [ "Umbrella", "Unicorn", "Urchin" ],
        "V" => [ "Van", "Vase", "Violin" ],
        "W" => [ "Wolf", "Water", "Wheel" ],
        "X" => [ "Xylophone", "X-ray" ],
        "Y" => [ "Yak", "Yarn", "Yacht" ],
        "Z" => [ "Zebra", "Zoo", "Zipper" ]
      }

      words.each do |letter, words|
        words.each do |word|
          Word.find_or_create_by(content: word, alphabet: alphabet)
        end
      end
    end
  end
end
