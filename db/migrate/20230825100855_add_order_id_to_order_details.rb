class AddOrderIdToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :order_id, :integer
    add_index :order_details, :order_id
    t.integer :making_status, null: false, default: 0
  end
end
