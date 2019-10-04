class RemoveAddressFromEvent < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :address_id
  end
end
