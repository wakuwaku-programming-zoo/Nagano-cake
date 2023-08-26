class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
   @order = Order.new(order_params)
   @order.customer = @customer
   @order.save
   @order.update(status: "waiting")        # ステータスを「入金待ち」に更新
   current_customer.cart_items.each do |cart_item|
   @order_detail = OrderDetail.new
   @order_detail.price = cart_item.item.with_tax_price
   @order_detail.quantity = cart_item.quantity
   @order_detail.order_id = @order.id
   @order_detail.item_id = cart_item.item.id
   @order_detail.save
  end
   current_customer.cart_items.destroy_all # カート内の商品を削除
  redirect_to public_orders_complete_path
  end

  def check
    @cart_items = current_customer.cart_items # カート内のアイテムを取得
    @order = current_customer.orders.build(order_params)
    # 選択された支払い方法とお届け先を @order に設定
    @order.payment_method = params[:order][:payment_method]

    # 自身の住所が選んだ時の処理
    if params[:order][:select_address] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      # 登録済のお届け先を選んだ時の処理
    elsif params[:order][:select_address] == "1"
      @address = ShippingAddress.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    # 新しいお届け先を登録した時の処理
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
