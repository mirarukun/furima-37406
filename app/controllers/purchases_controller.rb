class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_to_purchase_item_instance
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
   else
     render :index
   end
  end

  private
  
  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id:@item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token], 
      currency: 'jpy'
    )
  end

  def assign_to_purchase_item_instance
    @item = Item.find(params[:item_id])
  end
end