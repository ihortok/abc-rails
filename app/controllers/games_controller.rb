class GamesController < ApplicationController
  include AlphabetScoped

  def index
    @games = Game.available_for(alphabet)
  end
end
