class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :order_possible?


  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      order_payjp
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(
      :postcode, :prefecture_id, :city, :house_number, :building_name, :phone_number
    ).merge( user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def order_payjp
    Payjp.api_key = ENV["FURIMA_PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_possible?
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end
  end
end
