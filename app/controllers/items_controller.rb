class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("id DESC")
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
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_index
    redirect_to root_path if current_user.id != @item.user_id || @item.order.present?
  end
end
