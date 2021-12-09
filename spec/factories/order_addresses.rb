FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { Faker::Number.within(range: 1..47) }
    city { '東京都' }
    house_number { '1-1-1' }
    building_name { 'テスト荘' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
