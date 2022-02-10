FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {'2000-01-01'}
    last_name_chinese     {'山田'}
    first_name_chinese    {'太朗'}
    last_name_katakana    {'ヤマダ'}
    first_name_katakana   {'タロウ'}
  end
end