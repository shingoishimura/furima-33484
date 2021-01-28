FactoryBot.define do
  factory :item do
    
    item_name { 'aaaa' }
    text { 'aaaa' }
    category_id {2}
    state_id { 2 }
    send_fee_id { 2 }
    prefecture_id { 2 }
    send_period_id { 2 }
    price { 2000 }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
