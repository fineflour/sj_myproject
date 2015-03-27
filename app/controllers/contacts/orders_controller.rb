class Contacts::OrdersController < ApplicationController

  def index
    @orders = Order.where("contact_id = ?", params[:contact_id]) 
    #@orders = Order.all

      #.find_by_contact_id(26345)
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @orders = Order.find(params[:id])
    @order_products = @order.order_products
     # @contact.orders
  end

  def destroy
  end

  def create
  end

  def update
  end
end
