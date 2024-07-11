require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  before do
    @order_form = FactoryBot.build(:order_form)
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
      it 'post_code が空だと保存できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_code が正しく入力されていないと保存できない' do
        @order_form.post_code = '00000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'region_id が空だと保存できない' do
        @order_form.region_id = ''
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

      it 'phone_num が正しく入力されていないと保存できない' do
        @order_form.phone_num = '0000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num must be a valid phone number")
      end

      it 'token が空だと保存できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
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
