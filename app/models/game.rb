# Registry of the letter games. To add a game: add its route, controller, view
# and Stimulus controller, then register it in `Game.all`.
#
# `logic` is the game's PORO and must respond to `supports?(alphabet)`.
class Game < Data.define(:key, :title, :description, :image, :path_helper, :logic)
  def self.all
    [
      new(
        key: :missing_letters,
        title: "Допиши слово",
        description: "Допоможи ельфові дописати пропущені літери в слові.",
        image: "christmas/elf.png",
        path_helper: :alphabet_games_missing_letters_path,
        logic: Games::MissingLetters::PuzzleBuilder
      )
    ]
  end

  def self.available_for(alphabet)
    all.select { |game| game.logic.supports?(alphabet) }
  end
end
