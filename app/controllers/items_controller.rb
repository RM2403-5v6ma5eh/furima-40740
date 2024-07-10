class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
     render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user if user_signed_in?
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice:
    else
      render :edit, status: :unprocessable_entity
     end  
  end 

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

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

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    redirect_to items_path, notice: "Not authorized to edit this item" if @item.nil?
  end

end
