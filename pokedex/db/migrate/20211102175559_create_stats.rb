class CreateStats < ActiveRecord::Migration[6.1]
  def up
    create_table :stats do |t|
      t.string "name"
      t.string "url"
      t.timestamps
    end
  end

  def down
    drop_table :stats
  end  
end
