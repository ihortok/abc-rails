class LettersController < ApplicationController
  include AlphabetScoped

  def show
    @letter = alphabet.letters.find(params[:id])
  end
end
