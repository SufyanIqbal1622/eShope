class AddColumnToUsers < ActiveRecord::Migration[6.1]

  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :address_city, :string
    add_column :users, :address_country, :string
    add_column :users, :address_line, :string
    add_column :users, :card_number, :string
    add_column :users, :card_type, :string
    add_column :users, :cvc, :integer
    add_column :users, :expires_month, :integer
    add_column :users, :expires_year, :integer
  end
end
