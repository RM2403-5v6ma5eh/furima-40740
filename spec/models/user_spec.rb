require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
     context '新規登録できるとき' do
      it 'nickname、email、passwordとpassword_confirmation、その他すべての入力項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''  # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '0a0a'  # passwordの値を６文字未満にする
        @user.password_confirmation = '0a0a' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'  # passwordの値を英字のみ文字にする
        @user.password_confirmation = 'aaaaaa' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'  # passwordの値を数字のみ文字にする
        @user.password_confirmation = '000000' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end   
      it 'passwordが英数字以外では登録できない' do
        @user.password = 'ああああああ'  # passwordの値を英数字以外の文字にする
        @user.password_confirmation = 'ああああああ' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end 
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''  # password_confirmation の値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordの値がミスマッチでは登録できない' do
        @user.password = '0a0a0a0a' # passwordの値をミスマッチにする
        @user.password_confirmation = '1a0a0a0a'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''  # last_name の値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが全角文字意外では登録できない' do
        @user.last_name = '00'  # last_name の値を全角文字以外にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''  # first_name の値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角文字意外では登録できない' do
        @user.first_name = '00'  # first_name の値を全角文字意外にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''  # last_name_kana の値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaがカナ文字以外では登録できない' do
        @user.last_name_kana = '00'  # last_name_kana のカナ文字以外にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana  is invalid. Input full-width katakana characters"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''  # first_name_kana の値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaがカナ文字以外では登録できない' do
        @user.first_name_kana = '00'  # first_name_kana の値をカナ文字以外にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana  is invalid. Input full-width katakana characters"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''  # birthday の値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
