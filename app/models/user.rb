class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         with_options presence:true do
            validates :nickname
            validates :birthday
            validates :last_name_chinese ,format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message:"Last name is invalid. Input full-width characters"}
            validates :first_name_chinese ,format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message:"First name is invalid. Input full-width characters"}
            validates :last_name_katakana ,format: { with: /\A[ァ-ヶー]+\z/ , message:"Last name kana is invalid. Input full-width katakana characters"}
            validates :first_name_katakana ,format: { with: /\A[ァ-ヶー]+\z/ , message:"First name kana is invalid. Input full-width katakana characters"}
          end

          VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
          validates :password, format: { with: VALID_PASSWORD_REGEX, message:"is invalid. Include both letters and numbers" }

end
