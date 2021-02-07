class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :name
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
