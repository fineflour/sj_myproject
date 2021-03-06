class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.contacts_info.paginate(page: params[:page], per_page: 100) 
    @contacts_count = Contact.all.count
#    @address = @contacts.joins(:addresses).order('updated_at DESC').first
#    @contacts.address = @address
#    authorize @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    @contact_info = Contact.contacts_info.find(params[:id]) 
    @address = @contact.addresses.where(is_active: true).first
    #@contact.addresses = @address
    @order = @contact.orders.first 
    #.all(:includes => :order_products)
      #.order_detail(params[:id]).first
    #@contact.orders = @orders
    #@contact_order_info = Contact.contact_order_info.find(params[:id])
    #@order_details = @orders.order_products.order_detail.all  
#    @order_products = @orders.where(ops_order_id: @orders.ops_order_id)
      #@contact.orders.all
    #@order_details = Order.order_detail(params[:id])
#.all
#    @order_products = OrderProduct.all
  #Order.orders_detail(params[:id])

    #@email = @contact.email.where(is_active: true).first  
    #@contact.address = @address
    #@contact.email = @email

  end

  def create
  end

  def update
  end

  def destroy
  end

  def contact_params
    params.require(:contact).permit(:firstname, :lastname)
  end
end
