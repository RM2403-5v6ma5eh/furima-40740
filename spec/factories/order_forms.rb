FactoryBot.define do
  factory :order_form do
    post_code           { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    region_id           { Faker::Number.between(from: 2, to: 47) }
    municipality        { Faker::Address.city }
    street_address      { Faker::Address.street_address }
    build_name          { Faker::Address.secondary_address }
    phone_num           { Faker::Number.leading_zero_number(digits: 10).to_s }
    token               { 'tok_abcdefghijk00000000000000000' }
    item_id             { create(:item).id }
    user_id             { create(:user).id }
  end
end
