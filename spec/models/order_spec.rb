require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '配送先入力' do
    context '配送先入力が出来る場合' do
      it 'postal_numberがあれば登録できる' do
        @order.postal_number = '111-1111'
        expect(@order).to be_valid
      end

      it 'are_idで---以外を選択すれば登録できる' do
        @order.area_id = '3'
        expect(@order).to be_valid
      end

      it 'municipalitiesがあれば登録できる' do
        @order.municipalities = '佐藤太郎'
        expect(@order).to be_valid
      end

      it 'addressがあれば登録できる' do
        @order.address = '111'
        expect(@order).to be_valid
      end

      it 'tell_numberがあれば登録できる' do
        @order.tell_number = '09000000000'
        expect(@order).to be_valid 
      end
    end

    context '配送先入力が出来ない場合' do
      it 'postal_numberが空では登録できない' do
         @order.postal_number = ''
         @order.valid?
         expect(@order.errors.full_messages).to include("Postal number can't be blank", "Postal number is invalid")
      end

      it 'postal_numberに-が含まれていない場合登録できない' do
         @order.postal_number = '1111111'
         @order.valid?
         expect(@order.errors.full_messages).to include("Postal number is invalid")
      end

      it 'area_idが---を選択すると登録できない' do
         @order.area_id = '1'
         @order.valid?
         expect(@order.errors.full_messages).to include("Area must be other than 1")
      end

      it 'municipalitiesが空では登録できない' do
         @order.municipalities= ''
         @order.valid?
         expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空では登録できない' do
         @order.address= ''
         @order.valid?
         expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'tell_numberが空では登録できない' do
         @order.tell_number= ''
         @order.valid?
         expect(@order.errors.full_messages).to include("Tell number can't be blank", "Tell number is invalid")
      end

      it 'tell_numberが11桁より多い場合は登録できない' do
         @order.tell_number= '090111111111'
         @order.valid?
         expect(@order.errors.full_messages).to include("Tell number is invalid")
      end
    end
  end
end