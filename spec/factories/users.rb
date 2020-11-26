FactoryBot.define do
  factory :user do
    nickname {Faker::name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {"a1b2c3"}
    first_name {"仮名かなカナ"}
    last_name {"カナかな仮名"}
    first_name_kana {"カナカナカナ"}
    last_name_kana {"カナカナカナ"}
    birth_date {"1990-10-20"}
  end
end
