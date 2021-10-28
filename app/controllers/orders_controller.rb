class OrdersController < ApplicationController
  before_action :authenticate_user, only: [:create, :show]

  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.07
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    order.save
    render order.as_json
  end

  def show
    order = Order.find_by(id: params[:id], user_id: current_user.id)

    render json: order.as_json
  end

  def index
    orders = Order.where(user_id: current_user.id)
    render json: orders.as_json
  end
end
