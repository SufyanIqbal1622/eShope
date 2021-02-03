class AddColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :sub_total, :decimal, :precision => 8, :scale => 2
  end
end
