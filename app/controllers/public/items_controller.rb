class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  def create

  end
  
  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_sales_status, :genre_id)
  end

end
