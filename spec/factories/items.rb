FactoryBot.define do
  factory :item do
    product_name            {Faker::Name.initials(number: 2) }
    description             {Faker::Lorem.characters(number: 100)}
    category_id             {Faker::Number.between(from: 2, to: 11) } 
    condition_id            {Faker::Number.between(from: 2, to: 7) }
    burden_id               {Faker::Number.between(from: 2, to: 3) }
    region_id               {Faker::Number.between(from: 2, to: 48) }
    days_until_delivery_id  {Faker::Number.between(from: 2, to: 4) }
    price                   {Faker::Number.between(from: 300, to: 9999999) }
    association             :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/images/test_image.jpg')), filename: 'text_image.jpg' )
    end
  end
end
