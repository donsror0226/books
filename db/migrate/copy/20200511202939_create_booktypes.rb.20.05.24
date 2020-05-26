class CreateBooktypes < ActiveRecord::Migration[5.1]
  def change
    create_table :booktypes do |t|
      t.integer :book_type_idx, limit: 1, :unsigned => true, :unique => true, :null => false
      t.index :book_type_idx, :unique => true
      t.string :book_type_name, limit: 10, :null => false
      
      t.timestamps
    end
  end
end
