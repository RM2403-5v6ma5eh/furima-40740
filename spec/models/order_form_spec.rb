require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  before do
    @order_form = FactoryBot.build(:order_form)
  end

 describe '注文情報の保存' do
    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
     #   expect(@order_form).to be_valid
      end
    end

    context '保存できない場合' do
      it 'ship_nameが空だと保存できない' do
      #  @order_form.ship_name = ''
      #  @order_form.valid?
      #  expect(@order_form.errors.full_messages).to include("Ship name can't be blank")
      end

      it 'ship_addressが空だと保存できない' do
      #  @order_form.ship_address = ''
      #  @order_form.valid?
      #  expect(@order_form.errors.full_messages).to include("Ship address can't be blank")
      end

      it 'ship_phoneが空だと保存できない' do
      #  @order_form.ship_phone = ''
      #  @order_form.valid?
      #  expect(@order_form.errors.full_messages).to include("Ship phone can't be blank")
      end

      it 'quantityが空だと保存できない' do
      #  @order_form.quantity = nil
      #  @order_form.valid?
      #  expect(@order_form.errors.full_messages).to include("Quantity can't be blank")
      end

      it 'item_idが空だと保存できない' do
      #  @order_form.item_id = nil
      #  @order_form.valid?
      #  expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空だと保存できない' do
      #  @order_form.user_id = nil
      #  @order_form.valid?
      #  expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
