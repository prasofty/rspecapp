require 'faker'

FactoryGirl.define do
  factory :product do |f|
    f.name { Faker::Commerce.product_name }
    f.description { Faker::Lorem.paragraph }
    f.remote_image_url { 'https://robohash.org/product.png?size=300x300' }
    f.price { Faker::Commerce.price }
  end
end
