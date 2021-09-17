class ChangePokemonCardImageColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemon_cards, :image_url, :string
    add_column :pokemon_cards, :image, :string
    add_column :pokemon_cards, :image_thumbnail, :string
  end
end
