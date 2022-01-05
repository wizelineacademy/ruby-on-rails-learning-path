class MovesDescription < ActiveRecord::Migration[6.1]
  def change
    add_column("moves", "description", :string, :limit => 150)
  end
end
