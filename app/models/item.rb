class Item < ApplicationRecord
  has_many :cart_itmes, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
end
