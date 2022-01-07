class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, primary_key: :id do |t|
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps
      t.index :user_name
      t.index :email
    end
  end
end
