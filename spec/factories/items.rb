FactoryBot.define do
  factory :item do
    name           {Faker::Name.name}
    description    {Faker::Lorem.sentence}
    category_id    {2}
    status_id      {2}
    freight_id     {2}
    ship_state_id  {2}
    ship_day_id    {2}
    price          {2200}

    association       :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'),filename: 'test-image.png')
    end
  end
end
