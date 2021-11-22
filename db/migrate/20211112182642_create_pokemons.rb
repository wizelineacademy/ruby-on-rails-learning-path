class CreatePokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons do |t|
      t.string :name, :null => false
      t.string :sprite
      t.integer :base_experience, :default => 0
      t.integer :height, :null => false
      t.boolean :is_default, :default => false
      t.integer :order
      t.integer :weight, :null => false
      t.integer :hp, :null => false
      t.integer :attack, :null => false
      t.integer :defense, :null => false
      t.integer :special_attack, :null => false
      t.integer :special_defense, :null => false
      t.integer :speed, :null => false

      t.timestamps
    end
  end

  def down 
    drop_table :pokemons
  end
end