class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.string :name, :limit => 100
      t.timestamps
    end
  end
end
