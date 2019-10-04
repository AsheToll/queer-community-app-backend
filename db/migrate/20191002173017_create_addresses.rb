class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country
      t.integer :location_id

      t.timestamps
    end
  end
end
