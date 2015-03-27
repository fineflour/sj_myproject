class OrderProductsController < ApplicationController
  def index
      @order_products = Order
  end

  def show
    @order_product = OrderProduct.find_by_ops_order_id(1600877)      
  end

  def destroy
  end

  def create
  end

  def update
  end
end
