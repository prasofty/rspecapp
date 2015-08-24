delegate :params, :h, :link_to, :number_to_currency, to: :@view

def initialize(view)
  @view = view
end

def as_json(options = {})
  {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Product.count,
      iTotalDisplayRecords: products.total_entries,
      aaData: data
  }
end

private
def data
  products.map do |product|
    [
        link_to(product.name, product),
        h(product.category),
        h(product.released_on.strftime("%B %e, %Y")),
        number_to_currency(product.price)
    ]
  end
end

def fetch_products
  products = Product.order("#{sort_column} #{sort_direction}")
  products = products.page(page).per_page(per_page)
  if params[:sSearch].present?
    products = products.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
  end
  products
end