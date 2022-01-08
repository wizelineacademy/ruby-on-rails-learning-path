class CreateStats < ActiveRecord::Migration[7.0]
  def up
    create_table :stats do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :stats
  end
end
