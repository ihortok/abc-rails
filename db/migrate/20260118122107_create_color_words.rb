class CreateColorWords < ActiveRecord::Migration[8.1]
  def change
    create_table :color_words, id: :uuid do |t|
      t.belongs_to :color, null: false, foreign_key: true, type: :uuid
      t.belongs_to :word, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
