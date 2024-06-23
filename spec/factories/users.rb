FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.initials(number: 2) }
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {Faker::JapaneseName.last_name}
    first_name            {Faker::JapaneseName.first_name}
    last_name_kana        {Faker::JapaneseName.last_name_kana}
    first_name_kana       {Faker::JapaneseName.first_name_kana}
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
  
#  factory :user do
#    nickname              {'furima村上竜一'}
#    email                 {'r.m.2403@it-craftsman-kazuki.jp'}
#    password              {'000000'}
#    password_confirmation {password}
#    last_name             {'村上'}
#    first_name            {'竜一'}
#    last_name_kana        {'ムラカミ'}
#    first_name_kana       {'リュウイチ'}
#    birthday              {1964-07-11}
#  end

end