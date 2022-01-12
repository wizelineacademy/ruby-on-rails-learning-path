# frozen_string_literal: true

class CreateStats < ActiveRecord::Migration[6.1]
  def up
    create_table :stats do |t|
      t.string 'name', limit: 20, null: false
      t.string 'url', limit: 40, null: false
      t.timestamps
    end
  end

  def down
    drop_table :stats
  end
end
