class PurchasesController < ApplicationController
  before_action :set_item
  before_action :move_to_ibdex
  before_action :authenticate_user!

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

  private

  def purchase_params
    params.require(:purchase_user).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_ibdex
    redirect_to root_path if current_user.id == @item.user_id || !@item.purchase.nil?
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
