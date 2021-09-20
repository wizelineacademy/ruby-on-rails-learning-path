class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string "first_name", :limit => 50
      t.string "last_name", :limit => 50
      t.string "username", :limit => 25
      t.string "email", :default => '', :null => false, :limit => 100
      t.string "password_digest"
      t.integer "user_type_id"
      t.timestamps
    end
    add_index("users", "username")
    add_index("users", "email")
  end
end
