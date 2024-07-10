class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

 # def new
 #   @item = Item.find(params[:item_id])
 #   @order_form = OrderForm..new(current_user.id, @item.id)  
 # end

  def create
    # binding.pry
    Rails.logger.info("Received params: #{params.inspect}")

    @order_form = OrderForm.new(order_form_params.merge(token: params[:payjp_token]))
    @order_form.user_id = current_user.id 

    if @order_form.save
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      @item = Item.find(params[:item_id])
      @order_form.user_id = current_user.id
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_form_params
    params.require(:order_form)
          .permit(:itemd_id, :user_id, :post_code, :region_id, :municipality, :street_address, :phone_num)
  end

end
