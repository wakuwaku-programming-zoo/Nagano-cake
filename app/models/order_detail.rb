class OrderDetail < ApplicationRecord
  enum making_status: { cannot_start: 0, waiting: 1, making: 2, completion: 3 }
  belongs_to :item
  belongs_to :order
end
