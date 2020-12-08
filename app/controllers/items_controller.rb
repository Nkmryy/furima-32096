class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.includes(:user).order(created_at: 'DESC')
    @orders = Order.includes(:item)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  def edit
    redirect_to root_path if @order.present? || current_user.id != @item.user_id
  end

  def update
    if current_user.id == @item.user_id
      @item.update(item_params)
      if @item.valid?
        redirect_to item_path
      else
        render :edit
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :status_id, :freight_id, :state_id, :ship_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    @order = Order.find_by(item_id: @item.id)
  end
end
