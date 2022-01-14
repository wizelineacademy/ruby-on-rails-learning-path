class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.integer :pokemon_id
      t.string :name
      t.timestamps
    end
    add_index :types, :pokemon_id
  end
end
