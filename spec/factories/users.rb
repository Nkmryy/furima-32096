FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'A1b2c3' }
    password_confirmation { password }
    first_name            { '仮名かなカナ' }
    last_name             { 'カナかな仮名' }
    first_name_kana       { 'カナカナカナ' }
    last_name_kana        { 'カナカナカナ' }
    birth_date            { '1990-10-20' }
  end
end
