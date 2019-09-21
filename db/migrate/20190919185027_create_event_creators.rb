class CreateEventCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :event_creators do |t|
      t.integer :creator_id
      t.integer :event_id

      t.timestamps
    end
  end
end
