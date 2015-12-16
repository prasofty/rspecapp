require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name " + Faker::Commerce.product_name,
        :description => "Something " + Faker::Lorem.paragraph,
        :price => "10",
        :remote_image_url => "https://robohash.org/product.png?size=300x300"
      ),
      Product.create!(
        :name => "Name " + Faker::Commerce.product_name,
        :description => "Something " + Faker::Lorem.paragraph,
        :price => "10",
        :remote_image_url => "https://robohash.org/product.png?size=300x300"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>th", :text => "Name".to_s, :count => 1
    assert_select "tr>th", :text => "Description".to_s, :count => 1
    assert_select "tr>th", :text => "Price".to_s, :count => 1
    assert_select "tr>th", :text => "Image".to_s, :count => 1
  end
end
