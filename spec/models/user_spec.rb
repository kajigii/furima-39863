require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "必須項目が存在すれば登録できる" do
       expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end 
      it 'emailに@が含まれない' do
        @user.email = "example.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end


      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字以上で半角英数字混合である' do
        @user.password = 'pass.match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i)'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user = FactoryBot.build(:user, password: 'password123', password_confirmation: 'password456')
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end


      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）での入力が必須である' do
        @user.first_name = 'first_name.match(/\A[ぁ-んァ-ヶ一-龥々ー]+\z/)'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters"
      end
       
      it 'last_nameが空では登録できない' do
        @user = FactoryBot.build(:user, last_name: '')
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）での入力が必須である' do
        @user.last_name = 'first_name.match(/\A[ぁ-んァ-ヶ一-龥々ー]+\z/)'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters"
      end

      it 'first_name_kanaが空では登録できない' do
        @user = FactoryBot.build(:user, first_name_kana: '')
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaが全角（カタカナ）での入力が必須である' do
        @user.first_name_kana = 'first_name_kana.match(/\A[ァ-ヶー－]+\z/)'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters"
      end

      it 'last_name_kanaが空では登録できない' do
        @user = FactoryBot.build(:user, last_name_kana: '')
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaが全角（カタカナ）での入力が必須である' do
        @user.last_name_kana = 'last_name_kana.match(/\A[ァ-ヶー－]+\z/)'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters"
      end

      it 'date_of_birthが空では登録できない' do
        @user = FactoryBot.build(:user, date_of_birth: '')
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end
    end
  end
end
