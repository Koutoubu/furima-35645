require 'rails_helper'

RSpec.describe SharedAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @shared_address = FactoryBot.build(:shared_address, user_id: @user.id, item_id: @item.id)
    end

    context '商品購入ができる場合' do
      it '商品購入に必要な情報が全て入力されていれば登録できる' do
        expect(@shared_address).to be_valid
      end
      it '建物名は空欄でも登録できる' do
        @shared_address.building = ''
        expect(@shared_address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it '郵便番号が空欄だと保存できない' do
        @shared_address.postal_number = ''
        @shared_address.valid?
        expect(@shared_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it '都道府県が空欄だと保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it '市区町村が空欄だと保存できない' do
        @purchase_address.town = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it '番地が空欄だと保存できない' do
        @purchase_address.plot_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it '電話番号が空欄だと保存できない' do
        @purchase_address.phone_number =''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it '電話番号は半角のハイフンを含んだ正しい形でなければ保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Price is invalid')
      end
      it '電話番号は半角でなければ保存できない' do
        @purchase_address.phone_number = '１２３４５６７８９'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Price is invalid')
      end

      it 'userが紐づいていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("出品者を入力してください")
      end
      it 'itemが紐づいていないと保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("商品を入力してください")
      end
      it 'tokenが空欄だと保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it '電話番号が9桁以下では購入できない' do
        @purchase_address.phone_number = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は9桁から１２桁の半角で入力してください")
      end
      it '電話番号が12桁以上では購入できない' do
        @purchase_address.phone_number = '1234567891011'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は9桁から１２桁の半角で入力してください")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は数字のみで入力してください")
      end
    end
  end
end