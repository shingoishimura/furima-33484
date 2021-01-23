FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { 'shingoishimura@gmail.com' }
    password { 'mitumasa0710' }
    password_confirmation { password }
    last_name { '石村' }
    first_name { '真悟' }
    last_name_kana { 'イシムラ' }
    first_name_kana { 'シンゴ' }
    birth_date { '2020/10/01' }
  end
end
