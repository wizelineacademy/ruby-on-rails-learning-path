class CreateAbilities < ActiveRecord::Migration[6.1]
  def up
    create_table :abilities do |t|
      t.string :name
      t.timestamps
    end
  end

  def down 
    drop_table :abilities
  end
end
