class CreateSprites < ActiveRecord::Migration[6.1]
  def up
    create_table :sprites do |t|
      t.integer "pokemon_id"
      t.string "back_default"
      t.string "back_female"
      t.string "back_shiny"
      t.string "back_shiny_female"
      t.string "front_default"
      t.string "front_female"
      t.string "front_shiny"
      t.string "front_shiny_female"
      t.timestamps
    end
    add_index("sprites", "pokemon_id")
  end

  def down
    drop_table :sprites
  end
end
