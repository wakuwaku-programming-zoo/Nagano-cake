class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    # フォームから送信された商品のIDと数量を取得
    item_id = params[:cart_item][:item_id].to_i
    quantity = params[:cart_item][:quantity].to_i
    cart_item = current_customer.cart_items.find_by(item_id: item_id)  # カート内に同一商品が存在するか判定
    if cart_item
      cart_item.update(quantity: cart_item.quantity + quantity)        # カート内に同一商品が存在する場合、数量を追加
    else
      cart_item = current_customer.cart_items.new(item_id: item_id, quantity: quantity) # カート内に同一商品が存在しない場合、新しいレコードを作成
      cart_item.save
    end
    redirect_to public_cart_items_path
  end
  
   # カート内の商品一覧を表示
  def index
    @cart_items = current_customer.cart_items # カート内の商品を取得する
    @total = 0
    @cart_empty = @cart_items.empty?

  end

  # カート内の商品を更新
  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  # カート内の商品を削除
  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  # カート内の商品をすべて削除
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id,)
  end

end
