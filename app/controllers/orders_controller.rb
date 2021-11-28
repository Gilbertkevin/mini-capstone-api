class OrdersController < ApplicationController
  before_action :authenticate_user, only: [:create, :show]

  def create
    carted_products = current_user.carted_products.where(status: "Carted")

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.price * carted_product.quantity
    end

    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate

    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    order.save!

    carted_products.each do |carted_product|
      carted_product.status = "Carted"
      carted_product.order_id = order.id
      carted_product.save
    end
    render json: order.as_json
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
