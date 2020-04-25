class CreateMediaType < ActiveRecord::Migration[5.1]
  def change
    create_table :media_types do |t|
      t.integer :media_type_id, :limit => 2, :null = false
      t.string :media_type_name, :limit => 15, :null = false

      t.timestamps
    end
  end
end
