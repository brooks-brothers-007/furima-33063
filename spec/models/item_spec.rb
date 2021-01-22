require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end 

  describe "出品登録" do
    context '新規登録がうまくいくとき' do
      it "全ての情報が存在していると登録できること" do
        expect(@item).to be_valid
      end  
    end 

    context '出品がうまくいかないとき' do
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "informationが空では出品できない" do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end  

      it "category_idが0では出品できない" do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "sales_status_idが0では出品できない" do
        @item.sales_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
      end

      it "shipping_fee_status_idが0では出品できない" do
        @item.shipping_fee_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end

      it "prefecture_idが0では出品できない" do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end

      it "scheduled_delivery_idが0では出品できない" do
        @item.scheduled_delivery_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
      end

      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが半角数字でなければ出品できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it "priceが半角英数混合では登録できないこと" do
        @item.price = 'test3000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it "priceが半角英語だけでは登録できないこと" do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it "priceが￥300未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "priceが￥10,000,000以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

    end    
  end
end
