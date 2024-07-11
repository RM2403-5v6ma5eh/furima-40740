FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.initials(number: 2) }
    email                 {Faker::Internet.email}
    password              {'1a'+ Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {Faker::JapaneseName.last_name}
    first_name            {Faker::JapaneseName.first_name}
    last_name_kana        {Faker::JapaneseName.last_name_kana}
    first_name_kana       {Faker::JapaneseName.first_name_kana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
 end