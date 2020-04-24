class CreateBook < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :author, limit: 50
      t.string :title, limit: 25
      t.string :series_name, limit: 25
      t.integer :series_no
      t.string :isbn_tab_no, limit: 20
      t.string :publisher, limit: 20
      t.date :published_date
      t.string :location, limit: 20
      t.decimal :price, precision: 5, scale: 2
      t.date :purchase_date
      t.date :entry_date
      t.integer :condition_id, limit: 2
      t.integer :media_type_id, limit: 2
      t.integer :purpose_id, limit: 3
    end
  end
end
