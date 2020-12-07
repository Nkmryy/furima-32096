class OrdersController < ApplicationController
  before_action :set_item

  def index
    if @order == nil
      if user_signed_in?
        if @item.user_id != current_user.id
          @order_address = OrderAddress.new
        else
          redirect_to root_path
        end
      else
        redirect_to new_user_session_path
      end
    else
      redirect_to root_path
    end
  end

  def create
      @order_address = OrderAddress.new(order_address_params)
      if @order_address.valid?
        #pay_item
        @order_address.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :state_id, :address, :street, :building, :phone).merge(item_id: params[:item_id],token: params[:token], price: @item.price, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_address_params[:price],
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
    @order = Order.find_by(item_id: @item.id)
  end
end
