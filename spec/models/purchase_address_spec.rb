require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it '全ての項目が存在すれば購入できる' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Post code can't be blank"
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end

      it 'region_idが---では購入できない' do
        @purchase_address.region_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Region can't be blank"
      end
      
      it 'cityが空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end

      it 'street_addressが空では登録できない' do
        @purchase_address.street_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Street address can't be blank"
      end

      it 'telephone_numberが空では登録できない' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number can't be blank"
      end


      it 'telephone_numberが10桁未満では登録できない' do
        @purchase_address.telephone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is enter a half-width numeric value with 10 to 11 digits"
      end
      
      it 'telephone_numberが11桁以上では登録できない' do
        @purchase_address.telephone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is enter a half-width numeric value with 10 to 11 digits"
      end

      it 'telephone_numberが全角数字では登録できない' do
        @purchase_address.telephone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is enter a half-width numeric value with 10 to 11 digits"
      end
      
      it 'telephone_numberに-(ハイフン)が入ってると登録できない' do
        @purchase_address.telephone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is enter a half-width numeric value with 10 to 11 digits"
      end

      it 'userが紐付いていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐付いていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
