module Admin
  class LettersController < BaseController
    include AlphabetScoped

    def show
      @letter = alphabet.letters.find(params[:id])
      @words = alphabet.words.starting_with(@letter.character)
    end
  end
end
