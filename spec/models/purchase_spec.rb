require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it "priceがあれば保存ができること" do
      expect(@purchase).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @purchase.price = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Price can't be blank")
    end
  end


end
