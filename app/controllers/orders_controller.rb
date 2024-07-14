class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create ]
  before_action :set_item, only: [:index, :create]
  before_action :check_item_sold_out, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params.merge(token: params[:payjp_token]))
    @order_form.user_id = current_user.id 
    if @order_form.valid?
      pay_item      
      if  @order_form.save
        redirect_to root_path, notice: 'Order was successfully created.'
      else
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        render :index, status: :unprocessable_entity
      end 
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_item_sold_out
    if (@item.order.present?) || (@item.user_id  == current_user.id)
      redirect_to root_path, alert: 'この商品は既に販売されています。'
    end
  end

  def order_form_params
    params.require(:order_form)
          .permit(:item_id, :post_code, :region_id, :municipality, :street_address, :build_name, :phone_num)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @order_form.token, 
      currency: 'jpy'               
    )
  end

end
