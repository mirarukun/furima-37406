require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @user.id, item_id: @item.id)
    sleep 0.1 
  end
  
  describe '商品購入' do
    context '商品が購入できる場合' do
      it '必要な項目が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipping.building_name = ""
        expect(@purchase_shipping).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'user_idが空だと保存できないこと' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @purchase_shipping.post_code = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが「3桁ハイフン4桁」の正しい形式でないと保存できないこと' do
        @purchase_shipping.post_code = "1234567"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_shipping.prefecture_id = "0"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_shipping.municipalities = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase_shipping.house_number = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_shipping.telephone_number = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは10桁以上でないと保存できないこと' do
        @purchase_shipping.telephone_number = "123456789"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberは11桁以内でないと保存できないこと' do
        @purchase_shipping.telephone_number = "123456789012"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberは半角数値でないと保存できないこと' do
        @purchase_shipping.telephone_number = "１２３４５６７８９０"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number is invalid")
      end
    end
  end
end
