class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.integer :pokemon_id
      t.string :name
      t.timestamps
    end
    add_index :moves, :pokemon_id
  end
end
