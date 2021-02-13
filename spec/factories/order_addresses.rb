FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '426-0015' }
    prefecture_id { 2 }
    city { 'aaaAAAあああアアア' }
    street { '五十海1-1-24' }
    tel_num { '08032847871' }
    building { '２０３号室' }
  end
end
