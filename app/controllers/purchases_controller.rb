class PurchasesController < ApplicationController
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
   else
     render :index
   end
  end

  private
  
  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id)
  end
end
