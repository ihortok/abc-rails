class AlphabetsController < ApplicationController
  def index
    @alphabets = Alphabet.all
  end

  def show
    @alphabet = Alphabet.find(params[:id])
  end
end
