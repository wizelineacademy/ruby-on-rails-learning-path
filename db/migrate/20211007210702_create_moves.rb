class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
