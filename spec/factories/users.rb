FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    birthday              {'2000-01-01'}
    last_name_chinese     {'山田'}
    first_name_chinese    {'太朗'}
    last_name_katakana    {'ヤマダ'}
    first_name_katakana   {'タロウ'}
  end
end