FactoryBot.define do
  factory :user do
    user_name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name { '田なカ' }
    first_name { '太ろウ' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end