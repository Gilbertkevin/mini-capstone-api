class ProductsController < ApplicationController
  def one_product
    product = Product.find_by(id: 1)
    product.name
    render json: product.as_json
  end

  def all_products
    products = Product.all
    render json: products.as_json
  end
end
