FactoryBot.define do
  factory :order_address do
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    state_id { 2 }
    address { 'なんとか町' }
    street { '１−１−１' }
    building { 'hoge' }
    phone { '09000000000' }
  end
end
