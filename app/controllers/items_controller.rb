class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end
  

  private

  def items_params
    params.require(:items).permit(:product_name, :image).merge(user_id: current_user.id)
  end

end
