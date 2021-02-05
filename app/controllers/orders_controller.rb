class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    if @item.order.present?
      redirect_to root_path
    elsif user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif user_signed_in?
      @order_address = OrderAddress.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render action: :index

    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :street, :building, :tel_num).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
