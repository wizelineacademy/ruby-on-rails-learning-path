class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      t.string :first_name, :null => false, :limit => 25
      t.string :last_name, :null => false, :limit => 50
      t.string :email, :null => false, :limit => 100
      t.string :username, :null => false, :limit => 25
      t.string :password_digest
      t.timestamps
    end
  end

  def down 
    drop_table :users
  end
end
