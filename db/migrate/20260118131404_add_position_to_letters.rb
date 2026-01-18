class AddPositionToLetters < ActiveRecord::Migration[8.1]
  def change
    add_column :letters, :position, :integer
  end
end
