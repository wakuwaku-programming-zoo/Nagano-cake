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

  def update

  end

  def destroy

  end

  def destroy_all

  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id,)
  end

end
