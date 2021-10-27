class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.string :name
      t.integer :slot

      t.timestamps
    end
  end
end
