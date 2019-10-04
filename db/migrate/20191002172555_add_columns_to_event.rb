class AddColumnsToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :date, :date
    add_column :events, :time, :time
    add_column :events, :address_id, :integer
  end
end
