class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  # 一時的なパラメータを持たせたい
  attr_accessor :select_address
  attr_accessor :address_id
  order = Order.new
  order.save

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirmation: 1, making: 2, preparing: 3, sent: 4 }

  # 新しい注文が作成されたときに status フィールドを「入金待ち」に設定
  after_initialize :set_default_status
  private

  def set_default_status
    self.status ||= "waiting"
  end
end
