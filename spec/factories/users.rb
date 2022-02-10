FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    birthday              {'2000-01-01'}
    gimei = Gimei.name
    last_name_chinese     {gimei.last.kanji }
    first_name_chinese    {gimei.first.kanji }
    last_name_katakana    {gimei.last.katakana }
    first_name_katakana   {gimei.first.katakana }
  end
end