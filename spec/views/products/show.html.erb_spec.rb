require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name " + Faker::Commerce.product_name,
      :description => "Something " + Faker::Lorem.paragraph,
      :price => "10",
      :remote_image_url => 'https://robohash.org/product.png?size=300x300'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Something/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/Image/)
  end
end
