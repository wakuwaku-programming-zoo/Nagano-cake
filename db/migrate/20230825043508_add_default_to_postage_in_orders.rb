class AddDefaultToPostageInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :postage, :integer, default: 800

  end
end
