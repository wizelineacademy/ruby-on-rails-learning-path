class CreateAbilities < ActiveRecord::Migration[6.1]
  def up
    create_table :abilities do |t|
      t.string "name", :limit => 30, :null => false
      t.string "effect"
      t.string "url", :limit => 40, :null => false
      t.timestamps
    end
  end
  
  def down
    drop_table :abilities
  end

end
