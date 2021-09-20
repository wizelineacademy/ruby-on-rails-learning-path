class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.integer "pokeapi_id"
      t.string "name"
      t.timestamps
    end
    add_index("moves", "pokeapi_id")
    add_index("moves", "name")
  end
end
