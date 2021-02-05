FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email {Faker::Internet.free_email }
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    last_name { '石村' }
    first_name { '真悟' }
    last_name_kana { 'イシムラ' }
    first_name_kana { 'シンゴ' }
    birth_date { '2020/10/01' }
  end
end
