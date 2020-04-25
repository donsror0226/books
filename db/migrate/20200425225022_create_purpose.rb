class CreatePurpose < ActiveRecord::Migration[5.1]
  def change
    create_table :purposes do |t|
      t.integer :purpose_id, :limit => 3, :null = false
      t.string :purpose_type, :limit => 15, :null = false
      t.string :purpose_name, :limit => 20, :null = false

      t.timestamps
    end
  end
end
