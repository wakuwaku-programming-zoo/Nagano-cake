class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :name
      t.string :address
      t.string :postcode

      t.timestamps
    end
  end
end
