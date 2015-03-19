class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.contacts_detail.paginate(page: params[:page], per_page: 100) 
    @contacts_count = Contact.all.count
#    @address = @contacts.joins(:addresses).order('updated_at DESC').first
#    @contacts.address = @address
#    authorize @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    #@contact = Contact.contacts_detail.find(params[:id]) 
    @address = @contact.addresses.where(is_active: true).first
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
