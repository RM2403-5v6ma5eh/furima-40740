class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(item_id: @item.id)
  end

 # def new
 #   @item = Item.find(params[:item_id])
 #   @order_form = OrderForm..new(current_user.id, @item.id)  
 # end

  def create
    @order_form = OrderForm.new(order_form_params)
    @order_form.user_id = current_user.id
    @order_form.item_id = params[:item_id]

    if @order_form.save
      redirect_to items_path, notice: 'Order was successfully created.'
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:post_code, :region_id, :municipality, :street_address, :phone_num, :order)
  end

end
