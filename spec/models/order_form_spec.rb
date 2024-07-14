require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id )
  end

 describe '注文情報の保存' do
    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
      it 'build_name が空でも保存できる' do
        @order_form.build_name = ''
        expect(@order_form).to be_valid
      end
    end
    context '保存できない場合' do
      it 'token が空だと保存できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_code が空だと保存できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_code が正しく入力されていないと保存できない' do
        @order_form.post_code = '00000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'region_id が空だと保存できない' do
        @order_form.region_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Region can't be blank")
      end
      it 'municipality が空だと保存できない' do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_address が空だと保存できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_num が空だと保存できない' do
         @order_form.phone_num = ''
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_num が9文字以下だと保存できない' do
        @order_form.phone_num = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is too short")
      end
      it 'phone_num が12文字以上だと保存できない' do
        @order_form.phone_num = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid. Input only number")
      end
      it 'phone_num が半角数字以外が含まれていると登録できない' do
        @order_form.phone_num = '電話番号00000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid. Input only number")
      end

      it 'item_id が空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_id が空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
