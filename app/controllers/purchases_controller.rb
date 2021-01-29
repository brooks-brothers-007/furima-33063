class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_user = PurchaseUser.new
  end

  def create
    @purchase_user = PurchaseUser.new(purchase_params)
    if @purchase_user.valid?
      pay_item
      @purchase_user.save
      redirect_to root_path
    else
      render :index
    end
  end

  def purchase_params
    params.require(:purchase_user).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_params[:token],  
      currency: 'jpy'                 
    )
  end
end
