class CreateAdoptions < ActiveRecord::Migration[7.1]
  def change
    create_table :adoptions do |t|
      t.integer :breed_id
      t.integer :owner_id
      t.date :adoption_date

      t.timestamps
    end
  end
end
