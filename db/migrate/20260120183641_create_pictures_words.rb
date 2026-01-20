class CreatePicturesWords < ActiveRecord::Migration[8.1]
  def change
    create_table :pictures_words, id: :uuid do |t|
      t.references :picture, null: false, foreign_key: true, type: :uuid
      t.references :word, null: false, foreign_key: true, type: :uuid
    end
  end
end
