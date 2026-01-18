module DatabaseSeeds
  class EnglishAlphabetSeed
    def run
      # Create or find the English alphabet
      alphabet = Alphabet.find_or_create_by(name: "English")

      # Create letters A-Z for the English alphabet
      ("a".."z").to_a.each_with_index do |letter, index|
        alphabet.letters.find_or_create_by(character: letter, position: index + 1)
      end

      # Create some words for each letter
      words = {
        "a" => [ "Apple", "Ant", "Arrow" ],
        "b" => [ "Ball", "Bat", "Bee" ],
        "c" => [ "Cat", "Car", "Cup" ],
        "d" => [ "Dog", "Door", "Duck" ],
        "e" => [ "Elephant", "Egg", "Eagle" ],
        "f" => [ "Fish", "Fan", "Frog" ],
        "g" => [ "Goat", "Gate", "Gum" ],
        "h" => [ "Hat", "Horse", "House" ],
        "i" => [ "Ice", "Igloo", "Insect" ],
        "j" => [ "Jar", "Jam", "Jacket" ],
        "k" => [ "Kite", "Key", "Kangaroo" ],
        "l" => [ "Lion", "Lamp", "Leaf" ],
        "m" => [ "Monkey", "Moon", "Map" ],
        "n" => [ "Nest", "Net", "Nose" ],
        "o" => [ "Owl", "Orange", "Ox" ],
        "p" => [ "Pig", "Pen", "Pineapple" ],
        "q" => [ "Queen", "Quilt", "Quail" ],
        "r" => [ "Rat", "Ring", "Rocket" ],
        "s" => [ "Sun", "Star", "Snake" ],
        "t" => [ "Tiger", "Tree", "Table" ],
        "u" => [ "Umbrella", "Unicorn", "Urchin" ],
        "v" => [ "Van", "Vase", "Violin" ],
        "w" => [ "Wolf", "Water", "Wheel" ],
        "x" => [ "Xylophone", "X-ray" ],
        "y" => [ "Yak", "Yarn", "Yacht" ],
        "z" => [ "Zebra", "Zoo", "Zipper" ]
      }

      words.each do |letter, words|
        words.each do |word|
          Word.find_or_create_by(content: word, alphabet: alphabet)
        end
      end
    end
  end
end
