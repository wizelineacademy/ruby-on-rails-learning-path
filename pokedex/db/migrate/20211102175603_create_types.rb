class CreateTypes < ActiveRecord::Migration[6.1]
  def up
    create_table :types do |t|
      t.string "name", :limit => 40, :null => false
      t.string "url", :limit => 40, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :types
  end
end
