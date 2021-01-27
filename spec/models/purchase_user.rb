require 'rails_helper'
describe PurchaseUser do
  before do
    @purchase_user = FactoryBot.build(:purchase_user)
  end

  describe '購入情報登録' do
    context '購入がうまくいくとき' do
      it '全ての情報が存在していると登録できること' do
        expect(@purchase_user).to be_valid
      end
    end
   
    context '新規登録がうまくいかないとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_user).to be_valid
      end

      it 'postal_codeが空だと保存できないこと' do
        @purchase_user.postal_code = nil
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_user.postal_code = '1234567'
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Postal code Input correctly")
      end

      it 'prefecture_idが0では出品できない' do
        @purchase_user.prefecture_id = '0'
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空だと保存できないこと' do
        @purchase_user.city = ''
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @purchase_user.address = ''
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_user.phone_number = ''
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上では保存できないこと' do
        @purchase_user.phone_number = '090123456789'
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Phone number Input only number")
      end  

      it 'phone_numberが英文字だと保存できないこと' do
        @purchase_user.phone_number = 'abcdefghijk'
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberが半角英数混合だと保存できないこと' do
        @purchase_user.phone_number = '090abcdefgh'
        @purchase_user.valid?
        binding.pry
        expect(@purchase_user.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end