# frozen_string_literal: true

class CreateForms < ActiveRecord::Migration[6.1]
  def up
    create_table :forms do |t|
      t.integer 'pokemon_id', null: false
      t.string 'name', limit: 40, null: false
      t.string 'url', limit: 50, null: false
      t.timestamps
    end
    add_index('forms', 'pokemon_id')
  end

  def down
    drop_table :forms
  end
end
