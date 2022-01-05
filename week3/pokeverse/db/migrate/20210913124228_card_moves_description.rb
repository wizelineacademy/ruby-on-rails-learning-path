class CardMovesDescription < ActiveRecord::Migration[6.1]
  def change
    add_column("pokemon_card_moves", "description", :string, :limit => 200)
  end
end
