class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.integer :quantity

      t.timestamps
    end
    add_index :products, :category_id
  end
end
