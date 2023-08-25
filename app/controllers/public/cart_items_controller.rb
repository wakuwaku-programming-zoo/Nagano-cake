class Public::CartItemsController < ApplicationController
  
  def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
   if @cart_item.save
      redirect_to public_cart_items_path
   else
     @genres = Genre.all
     @item = Item.find(params[:cart_item][:item_id])
      render  "public/items/show"
   end
  end
  
   # カート内の商品一覧を表示
  def index
    @cart_items = current_customer.cart_items # カート内の商品を取得する
    @total = 0
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
