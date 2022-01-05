class AlterStat < ActiveRecord::Migration[7.0]
  def up
    add_column("stats", "stat_id", :integer, :null => false)
    add_column("abilities", "ability_id", :integer, :null => false)
  end

  def down
    remove_column("abilities", "ability_id")
    remove_column("stats", "stat_id")
  end
end
