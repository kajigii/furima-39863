require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる場合' do
      it '必須項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end


      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end


      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end


      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end


      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end


      it 'burden_idが空では登録できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden can't be blank"
      end


      it 'region_idが空では登録できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end


      it 'until_shipping_idが空では登録できない' do
        @item.until_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Until shipping can't be blank"
      end


      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが英字だと登録できない' do
        @item.price = 'abc'
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include "Price is invalid. Input half-width characters"
      end
      
      it 'priceが全角（漢字・ひらがな・カタカナ）だと登録できない' do
        @item.price = '漢字かなカナ' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid. Input half-width characters"
      end
      it 'priceが300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceが10000000円未満だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      
      it 'priceが英字だと登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid. Input half-width characters"
      end
      
      it 'priceが全角数字だと登録できない' do
        @item.price = '３００' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      
      it 'priceが300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      
      it 'priceが10000000円未満だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end