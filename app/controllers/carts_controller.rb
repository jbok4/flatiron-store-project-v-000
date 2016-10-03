class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |line_item|
    Item.find(line_item.item_id).decrement(:inventory, line_item.quantity).save
    end
    current_user.current_cart = nil
    redirect_to cart_path(params[:id])
  end

end