class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string "color", :default => "blue", :null => false
      t.text "description", :limit => 400
      t.timestamps
    end
  end
end
