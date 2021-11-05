class CreateMaestros < ActiveRecord::Migration[6.1]
  def up
    create_table :maestros do |t|
      t.string "name"
      t.string "email"
      t.string "region"
      t.string "hometown"
      t.string "picture"
      t.string "password_digest"
      t.timestamps
    end
  end

  def down
    drop_table :maestros
  end
end
