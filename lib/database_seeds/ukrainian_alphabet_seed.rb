module DatabaseSeeds
  class UkrainianAlphabetSeed
    require "json"

    LETTERS = %w[а б в г ґ д е є ж з и і ї й к л м н о п р с т у ф х ц ч ш щ ь ю я].freeze
    WORD_PICTURES_DIR = File.join(__dir__, "files", "word_pictures")
    WORD_SEEDS_PATH = File.join(__dir__, "files", "ukrainian_word_seeds.json")


    def run
      # Create or find the Ukrainian alphabet
      alphabet = Alphabet.find_or_create_by(name: "Абетка")
      alphabet.update(
        description: "Українська абетка складається з 33 літер, які використовуються в українській мові."
      )

      # Create letters A-Z for the Ukrainian alphabet
      LETTERS.each_with_index do |letter, index|
        alphabet.letters.find_or_create_by(character: letter, position: index + 1)
      end

      word_seeds.each do |_letter, word_entries|
        word_entries.each do |word_entry|
          word = Word.find_or_create_by(content: word_entry[:content], alphabet: alphabet)

          if word_entry[:color]
            color = Color.find_by(name: word_entry[:color])
            word.update(color: color) if color
          end

          image_filename = word_entry[:image]
          next unless image_filename

          image_path = File.join(WORD_PICTURES_DIR, image_filename)
          next if word.image.attached? || !File.exist?(image_path)

          File.open(image_path) do |file|
            word.image.attach(io: file, filename: image_filename)
          end
        end
      end
    end

    private

    def word_seeds
      JSON.parse(File.read(WORD_SEEDS_PATH), symbolize_names: true)
    end
  end
end
