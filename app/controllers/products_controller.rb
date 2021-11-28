class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    category = Category.find_by(name: params[:category])
    products = Product.all
    render json: products
  end

  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)

    render json: product.as_json(methods: [:is_discounted?, :tax, :total])
  end

  def create
    product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      supplier_id: params[:input_supplier_id],
      user_id: current_user.id,
    )
    if product.save
      params[:images].each do |image|
        new_image = Image.new(url: image, product_id: product.id)
        new_image.save
      end
      render json: product.as_json
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find_by(id: params[:id])

    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.supplier_id = params[:supplier_id] || product.supplier_id

    if product.save
      render json: product.as_json
    else
      render json: { errors: product.errors.full_messages }
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    render json: { message: "Product is removed" }
  end
end
