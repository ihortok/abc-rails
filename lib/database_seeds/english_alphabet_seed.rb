module DatabaseSeeds
  class EnglishAlphabetSeed
    def run
      # Create or find the English alphabet
      alphabet = Alphabet.find_or_create_by(name: "English")

      # Create letters A-Z for the English alphabet
      ("A".."Z").to_a.each do |letter|
        alphabet.letters.find_or_create_by(character: letter)
      end
    end
  end
end
