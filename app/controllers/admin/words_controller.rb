module Admin
  class WordsController < BaseController
    include AlphabetScoped
    include WordsHelper

    before_action :set_word, only: [ :edit, :update, :destroy ]
    before_action :set_colors, only: [ :new, :edit, :create, :update ]

    def new
      @word = alphabet.words.new
    end

    def edit
    end

    def create
      @word = alphabet.words.new(word_params)

      if @word.save
        redirect_to letter_path_for(@word), notice: "Word created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @word.update(word_params)
        redirect_to letter_path_for(@word), notice: "Word updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      redirect_path = letter_path_for(@word)
      @word.destroy
      redirect_to redirect_path, notice: "Word deleted."
    end

    private

    def set_word
      @word = alphabet.words.find(params[:id])
    end

    def set_colors
      @colors = Color.order(:name)
    end

    def word_params
      params.require(:word).permit(:content, :image, :color_id)
    end

  end
end
