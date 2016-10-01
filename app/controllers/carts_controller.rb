class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
  end

end
