require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは、@がない場合登録できない' do
        @user.email = 'aaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下の場合登録できない' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは、半角文字のみで場合登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは、半角数字のみで場合登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'last_name_zenkakuが空では登録できない。' do
        @user.last_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku can't be blank")
      end
      it 'first_name_zenkakuが空では登録できない。' do
        @user.first_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku can't be blank")
      end
      it 'last_name_zenkakuは半角の場合登録できない' do
        @user.last_name_zenkaku = 'satou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku is invalid")
      end
      it 'first_name_zenkakuは半角の場合登録できない' do
        @user.first_name_zenkaku = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku is invalid")
      end
      it 'last_name_kanaが空では登録できない。'do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない。' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが全角でなければ登録できない' do
        @user.last_name_kana = 'ｻﾄｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが全角でなければ登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'last_name_kanaが全角カタカナ以外の場合登録できない' do
        @user.last_name_kana = 'さとう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'first_name_kanaが全角カタカナ以外の場合登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '生年月日が空のとき登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
