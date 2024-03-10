class AddPhoneToOwners < ActiveRecord::Migration[7.1]
  def change
    add_column :owners, :phone, :string
  end
end
