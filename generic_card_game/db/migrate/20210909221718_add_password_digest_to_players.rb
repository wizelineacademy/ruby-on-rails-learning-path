class AddPasswordDigestToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column "players", "password_digest", :string
  end
end
