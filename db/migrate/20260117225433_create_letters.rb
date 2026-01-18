class CreateLetters < ActiveRecord::Migration[8.1]
  def change
    create_table :letters do |t|
      t.string :character
      t.belongs_to :alphabet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
