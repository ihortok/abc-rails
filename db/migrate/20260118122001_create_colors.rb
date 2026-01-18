class CreateColors < ActiveRecord::Migration[8.1]
  def change
    create_table :colors, id: :uuid do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
