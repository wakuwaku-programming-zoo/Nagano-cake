class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 退会済みのユーザーが同じアカウントでログインできないようにする
  def active_for_authentication?
    super && (is_cancel_membership == false)
  end

  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy



end
