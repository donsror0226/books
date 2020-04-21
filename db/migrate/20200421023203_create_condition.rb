class CreateCondition < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.integer :condition_id, limit: 2
      t.string :condition_name, limit: 10
    end
  end
end
