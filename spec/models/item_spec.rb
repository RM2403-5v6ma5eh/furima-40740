require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '商品名、商品の説明、その他すべての入力項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '画像（image）が空では登録できない' do
        @item.image = nil  #      it '画像（image）が空では登録できない' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Image must be attached"
      end
      it 'product_name の値が空では登録できない' do
        @item.product_name = ''  # product_nameの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it 'description の値が空では登録できない' do
        @item.description = ''  # descriptionの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_id の値 が１では登録できない' do
        @item.category_id = '1'  # category_id の値を１にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_id の値 が１では登録できない' do
        @item.condition_id = '1'  # condition_id の値を１にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'burden_id の値 が１では登録できない' do
        @item.burden_id = '1'   # burden_id の値を１にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden can't be blank"
      end
      it 'region_id の値 が１では登録できない' do
        @item.region_id = '1'  # region_id の値を１にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end   
      it 'days_until_delivery_id の値 が１では登録できない' do
        @item.days_until_delivery_id = '1'   # days_until_delivery_id の値を１にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Days until delivery can't be blank"
      end 
      it 'price の値が空では登録できない' do
        @item.price = ''  # price の値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'price の値が 300より小さければ登録できない' do
        @item.price = '299' # price の値を 300より小さくする
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'price の値が 9,999,999 より大きければ登録できない' do
        @item.price = '10000000'  # price の値を 9,999,999 より大きくする
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'prise の値に、全角文字が使われているときには登録できない' do
        @item.price = '金額'  # price の値に、全角文字が使われている
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil  # userが紐づいていないと登録できない
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
