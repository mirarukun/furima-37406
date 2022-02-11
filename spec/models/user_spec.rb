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
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あいうえおか'
        @user.password_confirmation = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save 
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が存在しない場合は登録できない' do
        @user.save 
        @user.email = "test.test.test"
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'お名前(全角)は、苗字が空では登録できない' do
        @user.last_name_chinese = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name chinese can't be blank", "Last name chinese is invalid. Input full-width characters") 
      end

      it 'お名前(全角)は、名前が空では登録できない' do
        @user.first_name_chinese = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name chinese can't be blank", "First name chinese is invalid. Input full-width characters") 
      end

      it '苗字(全角)は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name_chinese = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name chinese is invalid. Input full-width characters")
      end

      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name_chinese = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name chinese is invalid. Input full-width characters")
      end

      it 'お名前カナ(全角)は、苗字が空では登録できない' do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank", "Last name katakana is invalid. Input full-width katakana characters") 
      end

      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank", "First name katakana is invalid. Input full-width katakana characters") 
      end

      it '苗字カナ(全角)は、全角（カタカナ）でないと登録できない' do
        @user.last_name_katakana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid. Input full-width katakana characters")
      end

      it '名前カナ(全角)は、全角（カタカナ）でないと登録できない' do
        @user.first_name_katakana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid. Input full-width katakana characters")
      end

      it '生年月日は空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank") 
      end

    end
  end
end