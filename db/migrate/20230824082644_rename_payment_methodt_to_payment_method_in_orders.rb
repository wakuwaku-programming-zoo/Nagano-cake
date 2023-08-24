class RenamePaymentMethodtToPaymentMethodInOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :payment_methodt, :payment_method
  end
end
