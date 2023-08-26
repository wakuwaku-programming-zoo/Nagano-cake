class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :postcode)
  end
end