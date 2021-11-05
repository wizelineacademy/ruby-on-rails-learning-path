class CreateTeams < ActiveRecord::Migration[6.1]
  def up
    create_table :teams do |t|
      t.integer "pokemon_id"
      t.integer "maestro_id"
      t.string "name"
      t.integer "level"
      t.timestamps
    end
    add_index("teams", ["pokemon_id", "maestro_id"])
  end

  def down
    drop_table :teams
  end
end
