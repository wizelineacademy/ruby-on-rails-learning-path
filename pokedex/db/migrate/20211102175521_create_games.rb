class CreateGames < ActiveRecord::Migration[6.1]
  def up
    create_table :games do |t|
      t.integer "game_index"
      t.string "name"
      t.string "url"
      t.timestamps
    end
  end

  def down
    drop_table :games
  end
end
