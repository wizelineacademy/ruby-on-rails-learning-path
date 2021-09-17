class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :session_id, :unique => true
      t.integer :room_id, :required => false


      t.timestamps
    end
  end
end
