FactoryBot.define do
  factory :item do
    item_name {"オムレツ"}
    item_text {Faker::Lorem.sentence}
    category { Category.where.not(id:0).sample }
    status { Status.where.not(id:0).sample }
    shipping_information { ShippingInformation.where.not(id:0).sample }
    prefecture { Prefecture.where.not(id:0).sample }
    shipping_day { ShippingDay.where.not(id:0).sample }
    price { 100000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 
  end
end
