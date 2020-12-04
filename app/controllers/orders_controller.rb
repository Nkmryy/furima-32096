class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postl_code, :state_id, :address, :street, :phone, :order_id).marge(token: params[:token])
  end

end
