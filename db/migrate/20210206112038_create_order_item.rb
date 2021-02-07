class CreateOrderItem < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :cart_id

      t.timestamps
    end
    add_index :order_items, :cart_id
     add_index :order_items, :product_id
     add_index :order_items, :order_id

  end
end
