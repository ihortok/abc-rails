module Admin
  class WordsController < BaseController
    include AlphabetScoped

    def index
      @words = if params[:letter_id].present?
        alphabet.words.starting_with(params[:letter_id])
      else
        alphabet.words
      end
    end
  end
end
