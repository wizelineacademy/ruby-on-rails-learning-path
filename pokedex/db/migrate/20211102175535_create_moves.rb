# frozen_string_literal: true

class CreateMoves < ActiveRecord::Migration[6.1]
  def up
    create_table :moves do |t|
      t.string 'name', limit: 40, null: false
      t.string 'url', limit: 40, null: false
      t.timestamps
    end
  end

  def down
    drop_table :moves
  end
end
