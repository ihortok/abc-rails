class LettersController < ApplicationController
  include AlphabetScoped

  def show
    @letter = alphabet.letters.find(params[:id])
    @words = Word.starting_with(@letter.character)
  end
end
