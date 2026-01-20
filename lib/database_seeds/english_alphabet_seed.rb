module DatabaseSeeds
  class EnglishAlphabetSeed < BaseSeed
    require "json"

    LETTERS = ("a".."z").to_a.freeze
    WORD_PICTURES_DIR = File.join(__dir__, "files", "word_pictures")
    WORD_SEEDS_PATH = File.join(__dir__, "files", "english_word_seeds.json")

    def run
      # Create or find the English alphabet
      alphabet = Alphabet.find_or_create_by(name: "ABC")
      alphabet.update(
        description: "The English alphabet consists of 26 letters used in the English language."
      )

      # Create letters A-Z for the English alphabet
      LETTERS.each_with_index do |letter, index|
        alphabet.letters.find_or_create_by(character: letter, position: index + 1)
      end

      word_seeds.each do |_letter, word_entries|
        word_entries.each do |word_entry|
          word = Word.find_or_create_by(content: word_entry[:content], alphabet: alphabet)

          image_filename = word_entry[:image]
          next unless image_filename

          image_path = File.join(WORD_PICTURES_DIR, image_filename)
          next unless File.exist?(image_path)

          attach_picture(word, image_path, image_filename)
        end
      end
    end

    private

    def word_seeds
      JSON.parse(File.read(WORD_SEEDS_PATH), symbolize_names: true)
    end
  end
end
