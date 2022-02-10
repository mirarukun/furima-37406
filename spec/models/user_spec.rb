require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "テーブルに設計した全てのカラムが埋まっていれば登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.encrypted_password = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
      end

      



    end
  end
end