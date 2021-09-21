class CreatePokeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :poke_items, primary_key: :id do |t|
      t.integer :external_id, null: false
      t.string :name, null: false
      t.string :effect_description, null: false
      t.boolean :is_pokeball, null: false, default: false
      t.boolean :is_potion, null: false, default: false
      t.string :image_route, null: true
      t.integer :healing_hp, null: false, default: 0
      t.timestamps
    end
  end
end
