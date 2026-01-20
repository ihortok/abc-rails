class CreatePictures < ActiveRecord::Migration[8.1]
  def change
    create_table :pictures, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
