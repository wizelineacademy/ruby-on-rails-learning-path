# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.1]
  def up
    create_table :games do |t|
      t.integer 'game_index', default: 1, null: false
      t.string 'name', limit: 20, null: false
      t.string 'url', limit: 40, null: false
      t.timestamps
    end
  end

  def down
    drop_table :games
  end
end
