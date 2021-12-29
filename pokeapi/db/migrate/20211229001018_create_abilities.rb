class CreateAbilities < ActiveRecord::Migration[7.0]
  def up
    create_table :abilities do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :abilities
  end
end
