class CreateMoves < ActiveRecord::Migration[6.1]
  def up
    create_table :moves do |t|
      t.string "name"
      t.string "url"
      t.timestamps
    end
  end

  def down
    drop_table :moves
  end
end
