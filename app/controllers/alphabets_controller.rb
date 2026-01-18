class AlphabetsController < ApplicationController
  def index
    @alphabets = Alphabet.all
  end

  def show
    @alphabet = Alphabet.includes(:letters).find(params[:id])
  end
end
