class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons, primary_key: :id do |t|
      t.integer :external_id, null: true
      t.string :name, null: false
      t.string :image_route, null: true
      t.boolean :is_custom, null: false, default: false
      t.integer :base_hp, null: false
      t.timestamps
      t.index :name
    end
  end
end
