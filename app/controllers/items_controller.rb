class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit, :destroy]
  before_action :assign_to_item_instance, only: [ :show, :edit, :update, :destroy]
  before_action :move_to_index, only: [ :edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @purchase = Purchase.includes(:user, :item)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id,
                                 :status_id, :shipping_information_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

  def assign_to_item_instance
    @item = Item.find(params[:id])
  end
end
