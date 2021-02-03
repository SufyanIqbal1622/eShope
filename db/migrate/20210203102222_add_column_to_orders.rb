class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :total, :decimal, :precision => 8, :scale => 2
  end
end
