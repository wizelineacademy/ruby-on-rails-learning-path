class CreateAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :abilities do |t|
      t.integer :pokemon_id
      t.string :name
      t.timestamps
    end
    add_index :abilities, :pokemon_id
  end
end
