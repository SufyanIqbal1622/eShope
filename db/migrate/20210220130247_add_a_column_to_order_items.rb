class AddAColumnToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :sku_id, :string
  end
end
