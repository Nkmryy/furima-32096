FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    state_id { 2 }
    address { 'なんとか町' }
    street { '１−１−１' }
    building { 'hoge' }
    phone { '09000000000' }

    association :user
    association :item
  end
end
