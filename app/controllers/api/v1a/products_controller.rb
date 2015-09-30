class Api::V1a::ProductsController < Api::V1a::BaseController
  before_action :authenticate_user!

  def index
    products = Product.all.limit(10)
    render json: {products: products}
  end
end
