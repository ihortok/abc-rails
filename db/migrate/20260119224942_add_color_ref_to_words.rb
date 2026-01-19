class AddColorRefToWords < ActiveRecord::Migration[8.1]
  def change
    add_reference :words, :color, foreign_key: true, null: true, type: :uuid
  end
end
