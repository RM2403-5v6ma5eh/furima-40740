class OrdersController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])   
    @order_form = OrderForm.new(order_form_params.merge(token: params[:payjp_token]))
    @order_form.user_id = current_user.id 
    binding.pry
    if @order_form.valid?
      pay_item      
      binding.pry
      if  @order_form.save
        binding.pry 
        redirect_to root_path, notice: 'Order was successfully created.'
      else
        binding.pry
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        @item = Item.find(params[:item_id])   
        render :index, status: :unprocessable_entity
      end 
    else
      binding.pry
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @item = Item.find(params[:item_id])   
      render :index, status: :unprocessable_entity
    end
  end

  private

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
