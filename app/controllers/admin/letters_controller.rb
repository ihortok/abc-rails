module Admin
  class LettersController < BaseController
    include AlphabetScoped

    before_action :set_letter, only: [ :show, :update ]

    def show
      @words = alphabet.words.starting_with(@letter.character)
    end

    def update
      @letter.sound.purge if params[:letter]&.delete(:remove_sound) == "1"

      if @letter.update(letter_params)
        redirect_to admin_alphabet_letter_path(alphabet, @letter), notice: "Audio updated."
      else
        @words = alphabet.words.starting_with(@letter.character)
        render :show, status: :unprocessable_entity
      end
    end

    private

    def set_letter
      @letter = alphabet.letters.find(params[:id])
    end

    def letter_params
      params.require(:letter).permit(:sound)
    end
  end
end
