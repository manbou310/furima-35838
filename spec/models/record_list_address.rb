require 'rails_helper'

RSpec.describe RecordListAddress, type: :model do
  before do
    @record_list_address = FactoryBot.build(:record_list_address)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@record_list_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @record_list_address.building = ''
        expect(@record_list_address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it '郵便番号が空では購入できない' do
        @record_list_address.postcode = ''
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号は半角数字でなければ購入できない' do
        @record_list_address.postcode = '１２３ー４５６７'
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Postcode is invalid")
      end
      it '郵便番号にハイフンが含まれていないと購入できない' do
        @record_list_address.postcode = '1234567'
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Postcode is invalid")
      end
      it '郵便番号は数字でなければ購入できない' do
        @record_list_address.postcode = 'ｱｲｳーｴｵｶｷ'
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Postcode is invalid")
      end
      it '都道府県が1では購入できない' do
        @record_list_address.ship_form_id = '1'
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Ship form must be other than 1")
      end
      it '市町村が空では購入できない' do
        @record_list_address.city = ''
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @record_list_address.street = ''
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空では購入できない' do
        @record_list_address.phone_number = ''
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以内でなければ購入できない' do
        @record_list_address.phone_number = '123456789012'
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")

      end
      it '電話番号は半角数字でなければ購入できない' do
        @record_list_address.phone_number = '１２３４５６７８９０'
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'user_idが空では購入できない' do
        @record_list_address.user_id = ''
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @record_list_address.item_id = ''
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @record_list_address.token = nil
        @record_list_address.valid?
        expect(@record_list_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end