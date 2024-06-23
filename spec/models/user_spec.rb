require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
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
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''  # password_confirmation の値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''  # last_name の値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''  # first_name の値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''  # last_name_kana の値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''  # first_name_kana の値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''  # birthday の値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end