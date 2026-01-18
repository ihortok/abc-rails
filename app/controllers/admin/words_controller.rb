module Admin
  class WordsController < BaseController
    include AlphabetScoped

    before_action :set_word, only: [ :edit, :update, :destroy ]
    before_action :set_colors, only: [ :new, :edit, :create, :update ]

    def index
      @words = if params[:letter_id].present?
        alphabet.words.starting_with(params[:letter_id])
      else
        alphabet.words
      end
    end

    def new
      @word = alphabet.words.new
    end

    def edit
    end

    def create
      @word = alphabet.words.new(word_params)

      if @word.save
        redirect_to admin_alphabet_words_path(alphabet, letter_id: @word.starting_letter), notice: "Word created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @word.update(word_params)
        redirect_to admin_alphabet_words_path(alphabet, letter_id: @word.starting_letter), notice: "Word updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @word.destroy
      redirect_to admin_alphabet_words_path(alphabet, letter_id: @word.starting_letter), notice: "Word deleted."
    end

    private

    def set_word
      @word = alphabet.words.find(params[:id])
    end

    def set_colors
      @colors = Color.order(:name)
    end

    def word_params
      params.require(:word).permit(:content, :image, color_ids: [])
    end
  end
end
