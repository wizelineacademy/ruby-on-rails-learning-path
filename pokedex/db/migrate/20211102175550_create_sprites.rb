# frozen_string_literal: true

class CreateSprites < ActiveRecord::Migration[6.1]
  def up
    create_table :sprites do |t|
      t.integer 'pokemon_id', null: false
      t.string 'back_default', limit: 100, null: false
      t.string 'back_female', limit: 100
      t.string 'back_shiny', limit: 100
      t.string 'back_shiny_female', limit: 100
      t.string 'front_default', limit: 100, null: false
      t.string 'front_female', limit: 100
      t.string 'front_shiny', limit: 100
      t.string 'front_shiny_female', limit: 100
      t.timestamps
    end
    add_index('sprites', 'pokemon_id')
  end

  def down
    drop_table :sprites
  end
end
