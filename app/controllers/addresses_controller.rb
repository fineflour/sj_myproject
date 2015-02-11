class AddressesController < ApplicationController
  
  def new
#    pry.binding
     @user_id = current_user.id
     @address = Address.new
  end

  def create
    user = User.find(params[:user_id])
    @address = user.address.create(address_params)

      respond_to do |format|
          if @address.save
              format.html { redirect_to([@address.user, @address], flash[:success] => "New Address has been added!")}
              format.xml  { render :xml => @comment, :status => :created, :location => [@comment.post, @comment] }
         else
              format.html { render :action => "new" }
              format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
         end
      end
  end

  def index
    #@addresses = Address.all.order('id desc')
    user = User.find(params[:user_id])
    @addresses = user.address

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def show
    user = User.find(params[:user_id])
    @address = user.address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def new
    user=User.find(params[:user_id])
    @address = user.address.build

    respond_to do |format|
      format.html
      format.xml { render :xml => @address }
    end
  end

  def edit
    user = User.find(params[:user_id])
    @address = user.address.find(params[:id])
  end

  def update

    user = User.find(params[:user_id])
    @address = user.address.find(params[:id])

    respond_to do |format|
      if @address.update(address_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource address
        format.html { redirect_to([@address.user, @address], :notice => 'Address was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy     
    user = User.find(params[:user_id])     
    @address = user.address.find(params[:id])
    @address.destroy

    respond_to do |format|     
      format.html { redirect_to(user_address_url) }
      format.xml  { head :ok }
    end
  end

private

  def address_params
    params.require(:address).permit(:user_id, :address1, :address2, :city, :state_id, :zipcode)
  end
end
