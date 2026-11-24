module Games
  class MissingLettersController < BaseController
    def show
      @puzzles = Games::MissingLetters::PuzzleBuilder.new(alphabet).build
    end
  end
end
