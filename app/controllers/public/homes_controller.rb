class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @customer = current_customer if customer_signed_in?
  end

  def about
  end
end
