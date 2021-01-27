class PurchasesController < ApplicationController
  def index
    @purchase_user = PurchaseUser.new  
    @item = Item.find(params[:item_id])
  end
  
  def create
    @purchase_user = PurchaseUser.new(purchase_params)
    if @purchase_user.valid?
       @purchase_user.save
       redirect_to root_path
    else
       render :index
    end
  end  

  def purchase_params
    params.require(:purchase_user).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number
    ).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
