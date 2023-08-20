class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :payment_methodt, null: false, default: 0
      t.integer :postage
      t.integer :total_amount
      t.integer :status, null: false, default: 0
      t.string :postcode
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
