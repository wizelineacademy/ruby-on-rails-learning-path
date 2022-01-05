class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users, primary_key: :id do |t|
      t.string :name, :null => false
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.index :username
      t.index :email
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
