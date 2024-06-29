class ItemsController < ApplicationController
  def index
  #  @items = Iten.order("create_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(itema_params)
    if @items.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:items).permit(:product_name, :image).merge(user_id: current_user.id)
  end

end
