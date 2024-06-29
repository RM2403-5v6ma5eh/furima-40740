class ItemsController < ApplicationController
  def index
  #  @items = Item.all
  #  @items = Iten.order("create_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
      binding.pry
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
        :product_name, 
        :image, 
        :description,
        :price, 
        :category_id, 
        :condition_id, 
        :burden_id, 
        :region_id, 
        :days_until_delivery_id
      ).merge(user_id: current_user.id)
  end

end
