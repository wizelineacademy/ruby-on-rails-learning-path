class MakeEmailUnique < ActiveRecord::Migration[6.1]
  def change
    add_index :players, :email, :unique => true
  end
end
