class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.integer :condition_id, limit: 1, :unsigned => true, :unique => true, :null => false
      t.index :condition_id, :unique => true
      t.string :condition_name, limit: 10, :null => false
      
      t.timestamps    end
  end
end
