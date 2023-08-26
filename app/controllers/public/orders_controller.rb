class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer = @customer
    @order.save
    redirect_to public_orders_complete_path

  end

  def check
    @cart_items = current_customer.cart_items # カート内のアイテムを取得
    @order = current_customer.orders.build(order_params)
    # 選択された支払い方法とお届け先を @order に設定
    @order.payment_method = params[:order][:payment_method]

    # @address = ShippingAddress.find(params[:order][:shipping_address_id])
    if params[:order][:select_address] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = ShippingAddress.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    else
      @address = ShippingAddress.new(postcode: params[:order][:postcode], address: params[:order][:address], name: params[:order][:name])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    end

  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:payment_method, :postage, :total_amount, :status, :postcode, :address, :name, :select_address, :address_id)
  end

end
