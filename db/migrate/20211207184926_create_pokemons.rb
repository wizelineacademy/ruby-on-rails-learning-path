class CreatePokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons do |t|
      t.string :name, :null => false
      t.integer :height
      t.integer :weight
      t.integer :base_experience
      t.timestamps
    end
  end

  def down
    drop_table :pokemons
  end
end
