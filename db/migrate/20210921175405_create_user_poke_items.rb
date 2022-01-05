class CreateUserPokeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :user_poke_items do |t|
      t.integer :quantity, null: true, default: 0
      t.references :user
      t.references :poke_item
      t.timestamps
    end
  end
end
