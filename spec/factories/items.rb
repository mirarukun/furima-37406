FactoryBot.define do
  factory :item do
    item_name {"オムレツ"}
    item_text {Faker::Lorem.sentence}
    category { Category.all.sample }
    status { Status.all.sample }
    shipping_information { ShippingInformation.all.sample }
    prefecture { Prefecture.all.sample }
    shipping_day { ShippingDay.all.sample }
    price { 100000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 
  end
end
