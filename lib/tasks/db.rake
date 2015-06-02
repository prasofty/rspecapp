require 'faker'

namespace :db do
  desc "Populate fake data"
  task populate: :environment do
    make_products
  end
end


def make_products
    20.times do |n|
        product_name = Faker::Commerce.product_name
        Product.create!(
            name: product_name,
            description: Faker::Lorem.paragraph,
            price: Faker::Commerce.price,
            remote_image_url: Faker::Avatar.image(product_name)
        )
    end
end