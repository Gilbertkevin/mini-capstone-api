class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "Carted",
    )
    carted_product.save!
    render json: carted_product.as_json
  end

  def index
    carted_products = current_user.carted_products.where(status: "Carted")

    render json: carted_products

    # carted = CartedProduct.where(user_id: current_user.id)

    # carted_status = carted.where(status: "Carted")

    # render json: carted_status.as_json
  end
end
