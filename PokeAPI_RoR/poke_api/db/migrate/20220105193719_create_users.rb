class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 25
      t.string :email, default: '', null: false
      t.string :password, limit: 40
      t.timestamps
    end
  end
end
