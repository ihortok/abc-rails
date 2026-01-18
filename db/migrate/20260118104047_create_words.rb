class CreateWords < ActiveRecord::Migration[8.1]
  def change
    create_table :words, id: :uuid do |t|
      t.string :content
      t.belongs_to :alphabet, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
