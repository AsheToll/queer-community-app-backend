class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :image
      t.integer :location_id
      t.text :description

      t.timestamps
    end
  end
end
