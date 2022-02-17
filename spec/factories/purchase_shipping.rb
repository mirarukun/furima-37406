FactoryBot.define do
  factory :purchase_shipping do
    post_code { "111-1111" }
    prefecture_id{ "2" }
    municipalities { "浜松市東区" }
    house_number { "青山1-1-1" }
    building_name { "テストビル" }
    telephone_number { "09011111111" }
  end
end
