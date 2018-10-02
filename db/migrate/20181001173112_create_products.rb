class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.string :model, :null => false
      t.string :brand, :null => false
      t.string :year, :null => false
      t.integer :ram, :null => false
      t.integer :external, :null => false
    end
  end
end
