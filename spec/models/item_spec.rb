require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる場合' do
      it '必須項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end


      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end


      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end


      it 'category_idが---では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end


      it 'condition_idが---では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end


      it 'burden_idが---では出品できない' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden can't be blank"
      end


      it 'region_idが---では出品できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end


      it 'until_shipping_idが---では出品できない' do
        @item.until_shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Until shipping can't be blank"
      end
        
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      
      it 'priceが全角数字だと出品できない' do
        @item.price = '３００' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      
      it 'priceが300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      
      it 'priceが10000000円未満だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end