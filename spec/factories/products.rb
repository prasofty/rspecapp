require 'faker'

FactoryGirl.define do
  factory :product do |f|
    f.name { Faker::Commerce.product_name }
    f.description { Faker::Lorem.paragraph }
    f.remote_image_url { Faker::Avatar.image('product') }
    f.price { Faker::Commerce.price }
  end
end