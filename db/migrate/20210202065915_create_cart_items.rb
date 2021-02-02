class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
    add_index :cart_items, :user_id
    add_index :cart_items, :product_id
  end
end
