class AddDescriptionToAlphabets < ActiveRecord::Migration[8.1]
  def change
    add_column :alphabets, :description, :string
  end
end
