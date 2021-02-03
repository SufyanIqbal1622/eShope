class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :cart_item
      t.references :product
      t.integer :quantity

      t.timestamps
    end

  end
end
