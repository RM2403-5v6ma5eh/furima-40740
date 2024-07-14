FactoryBot.define do
  factory :order_form, class: OrderForm do
    post_code           { '573-1134' }
    region_id           { 2 }
    municipality        { '枚方市養父丘' }
    street_address      { '1-7-16' }
    build_name          { 'スカイタワー ' }
    phone_num           { '1234567890' }
    token               { 'tok_abcdefghijk00000000000000000' }
  #  item_id             { 1 }
  #  user_id             { 1 }
  end

end

