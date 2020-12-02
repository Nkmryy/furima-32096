class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user).order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(message_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def message_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :status_id, :freight_id, :ship_state_id, :ship_day_id).merge(user_id: current_user.id)
  end
end
