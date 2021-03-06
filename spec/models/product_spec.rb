require 'rails_helper'
require 'faker'
require 'factory_girl_rails'

RSpec.describe Product, type: :model do

  it "is valid with a name, description, price and image"  do
    expect(FactoryGirl.create(:product)).to be_valid
  end

  it "is invalid without a name" do
    product = FactoryGirl.build(:product, name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    product = FactoryGirl.build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a price" do
    product = FactoryGirl.build(:product, price: nil)
    product.valid?
    expect(product.errors[:price_cents]).to include("must be greater than 0")
  end

  it "is invalid without a image" do
    product = FactoryGirl.build(:product, remote_image_url: nil)
    product.valid?
    expect(product.errors[:image]).to include("can't be blank")
    expect([1, 2]).to include(1)
  end

  it "is invalid with a duplicate name" do
    product = FactoryGirl.build(:product)
    
  end

  it "is invalid with a name less then five characters" do
    product = FactoryGirl.build(:product, name:  '1234')
    product.valid?
    expect(product.errors[:name]).to include("is too short (minimum is 5 characters)")
  end

  it "is invalid with a description less then 100 characters" do
    product = FactoryGirl.build(:product, description:  '1234')
    product.valid?
    expect(product.errors[:description]).to include("is too short (minimum is 100 characters)")
  end

  it "is invalid with a price as string" do
    product = FactoryGirl.build(:product, price: 'asd')
    product.valid?
    expect(product.errors[:price]).to include("is not a number")
  end

  it "adds 2 and 1 to make 3" do
    expect(2 + 1).to eq 3
  end
end
