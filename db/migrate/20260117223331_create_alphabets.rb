class CreateAlphabets < ActiveRecord::Migration[8.1]
  def change
    create_table :alphabets, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
