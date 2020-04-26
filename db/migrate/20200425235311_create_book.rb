class CreateBook < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :author, :limit => 50, :null = false
      t.string :title, :limit => 25, :null = false
      t.string :series_name, :limit => 25
      t.integer :series_no, :limit => 3, :unsigned => true
      t.string :isbn_tab_no, limit => 20, :null = false
      t.string :publisher, :limit => 20, :null = false
      t.date :published_date
      t.string :location, :limit => 20, :null = false 
      t.float :price
      t.date :purchase_date
      t.date :entry_date
      t.integer :condition_id, :limit => 1, :null = false
      t.integer :media_type_id, :limit => 1, :null = false
      t.integer :purpose_id, :limit => 2, :null = false

      t.timestamps
          end
  end
end
