class Admin::OrdersController < ApplicationController

  def new

  end

  def check

  end

  def complete
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(making_status: "waiting") if @order.status == "confirmation"
    end
      redirect_to admin_order_path(@order)
  end

  private
  def order_params
  params.require(:order).permit(:status)
  end
end
