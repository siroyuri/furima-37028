FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 1..10) }
    status_id { Faker::Number.within(range: 1..6) }
    which_one_id { Faker::Number.within(range: 1..2) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    days_id { Faker::Number.within(range: 1..3) }
    price { Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
