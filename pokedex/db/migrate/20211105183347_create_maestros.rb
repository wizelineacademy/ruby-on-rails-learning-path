# frozen_string_literal: true

class CreateMaestros < ActiveRecord::Migration[6.1]
  def up
    create_table :maestros do |t|
      t.string 'name', limit: 30, null: false
      t.string 'email', limit: 50, null: false
      t.string 'region', limit: 30
      t.string 'hometown', limit: 30
      t.string 'picture', limit: 100
      t.string 'password_digest', null: false
      t.timestamps
    end
  end

  def down
    drop_table :maestros
  end
end
