class CreatePurpose < ActiveRecord::Migration[5.1]
  def change
    create_table :purposes do |t|
      t.integer :purpose_id, limit: 3
      t.string :purpose_type, limit: 15
      t.string :purpose_name, limit: 20
    end
  end
end
