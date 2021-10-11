require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品が出来る場合' do
      it 'imageがあると登録できる' do
        expect(@item).to be_valid
      end
      it 'nameがあると登録できる' do
        @item.name = 'a'
        expect(@item).to be_valid
      end
      it 'explanationがあると登録できる' do
        @item.explanation = 'a'
        expect(@item).to be_valid
      end
      it 'category_idで---以外を選択すると登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'seller_idで---以外を選択すると登録できる' do
        @item.seller_id = 2
        expect(@item).to be_valid
      end
      it 'status_idで---以外を選択すると登録できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'area_idで---以外を選択すると登録できる' do
        @item.area_id = 2
        expect(@item).to be_valid
      end
      it 'date_id_idで---以外を選択すると登録できる' do
        @item.date_id_id = 2
        expect(@item).to be_valid
      end
      it 'priceがあると登録できる' do
        @item.price = 1111
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = 1111
        expect(@item).to be_valid
      end
    end
    context '商品出品が出来ないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idで---を選択すると登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'seller_idで---を選択すると登録できない' do
        @item.seller_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Seller must be other than 1')
      end
      it 'status_idで---を選択すると登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'area_idで---を選択すると登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'date_id_idで---を選択すると登録できない' do
        @item.date_id_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Date id must be other than 1')
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より小さいと登録できない' do
        @item.price = 111
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが9999999より大きいと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが全角数字だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが英数字混合だと登録できない' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが半角英字では登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end