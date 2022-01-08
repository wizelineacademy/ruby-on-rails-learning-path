class CreatePokemons < ActiveRecord::Migration[7.0]
  def up
    create_table :pokemons do |t|
      t.string :name, :null => false
      t.integer :base_experience
      t.integer :height
      t.integer :weight
      t.timestamps
    end
  end

  def down
    drop_table :pokemons
  end
end
