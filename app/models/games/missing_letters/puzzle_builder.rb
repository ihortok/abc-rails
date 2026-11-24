module Games
  module MissingLetters
    # Builds the rounds for "Допиши слово": a picture word with a few letters
    # blanked out, plus a tray with the missing letters and some distractors.
    class PuzzleBuilder
      # Letters the game starts with. Only words made of these letters are used.
      LETTERS = %w[у к е н г і а в п р о л д я с м и т б].freeze

      ROUNDS = 5
      DISTRACTORS = 3
      WORD_LENGTH = (3..6)

      Slot = Data.define(:letter, :blank)
      Puzzle = Data.define(:word, :slots, :tray)

      # The game is only offered for alphabets that contain some of its letters.
      def self.supports?(alphabet)
        alphabet.letters.pluck(:character).any? { |character| LETTERS.include?(character.downcase) }
      end

      def initialize(alphabet, rounds: ROUNDS)
        @alphabet = alphabet
        @rounds = rounds
      end

      def build
        candidates.sample(@rounds).map { |word| build_puzzle(word) }
      end

      # Words with a picture whose letters all belong to LETTERS. Filtered in Ruby
      # rather than SQL because case-insensitive Cyrillic matching in Postgres
      # depends on the database locale.
      def candidates
        @alphabet.words
          .includes(pictures: { picture_file_attachment: :blob })
          .select { |word| playable?(word) }
          .uniq(&:content)
      end

      private

      def playable?(word)
        chars = word.content.downcase.chars

        WORD_LENGTH.cover?(chars.size) &&
          chars.all? { |char| LETTERS.include?(char) } &&
          word.picture_attached?
      end

      def build_puzzle(word)
        chars = word.content.downcase.chars
        blank_indexes = chars.each_index.to_a.sample(blank_count(chars.size))

        slots = chars.each_with_index.map do |char, index|
          Slot.new(letter: char, blank: blank_indexes.include?(index))
        end

        missing = slots.select(&:blank).map(&:letter)
        distractors = (LETTERS - chars).sample(DISTRACTORS)

        Puzzle.new(word: word, slots: slots, tray: (missing + distractors).shuffle)
      end

      # 3-4 letter words lose one letter, 5-6 letter words lose two.
      def blank_count(length)
        [ 1, (length / 3.0).round ].max
      end
    end
  end
end
