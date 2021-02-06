class CreateOrderItem < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :product
      t.references :order
      t.decimal :unit_price
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end
end
