class OrdersController < ApplicationController

  def index
    @contacts = Contact.contacts_detail.paginate(page: params[:page], per_page: 100) 
    @orders = Contact.contacts_detail.paginate(page: params[:page], per_page: 100) 
    #@orders = Order.all

      #.find_by_contact_id(26345)
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @orders = Order.where(:contact_id => @contact.id)
     # @contact.orders
  end

  def destroy
  end

  def create
  end

  def update
  end
end
