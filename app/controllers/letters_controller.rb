class LettersController < ApplicationController
  include AlphabetScoped

  CONTAINING_LETTERS = %w[и ь].freeze

  def show
    @letter = alphabet.letters.find(params[:id])
    @contains_match = CONTAINING_LETTERS.include?(@letter.character.downcase)
    @words = if @contains_match
      Word.containing(@letter.character)
    else
      Word.starting_with(@letter.character)
    end
  end
end
