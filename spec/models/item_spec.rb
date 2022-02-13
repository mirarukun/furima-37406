require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存される' do
        expect(@item).to be_valid
      end
      it '価格は、¥300~¥9,999,999の間であれば保存できる' do

      end
    end

    context '商品が出品できない場合' do
      it '商品画像を1枚つけないと保存できない' do

      end
      it '商品名が記入されていないと保存できない' do

      end
      it '商品の説明が記入されていないと保存できない' do

      end
      it 'カテゴリーの情報が選択されていないと保存できない' do

      end
      it '商品の状態の情報が選択されていないと保存できない' do

      end
      it '配送料の負担の情報が選択されていないと保存できない' do

      end
      it '発送元の地域の情報が選択されていないと保存できない' do

      end
      it '発送までの日数の情報が選択されていないと保存できない' do

      end
      it '価格が記入されていないと保存できない' do

      end
      it '価格は、¥300~¥9,999,999の間でなければ保存できない' do

      end
      it '価格は半角数値でなければ保存できない' do

      end
    end
  end
end

