class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|

      t.timestamps
    end
  end
end
