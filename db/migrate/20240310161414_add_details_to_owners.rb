class AddDetailsToOwners < ActiveRecord::Migration[7.1]
  def change
    add_column :owners, :phone_number, :string
    add_column :owners, :address, :string
  end
end
