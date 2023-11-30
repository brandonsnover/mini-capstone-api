class OrdersController < ApplicationController
  def create
    carted_products = current_user.carted_products.where(status: "carted")

    calculated_subtotal = 0
    pp calculated_subtotal

    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity.to_f * carted_product.product.price.to_f
    end
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    if @order.save
      carted_products.update_all(status: "purchased", order_id: @order.id)
      render :show
    else
      render json: { errors: @order.errors.full_message }
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    if current_user && current_user.id == @order.user_id
      render :show
    else
      render json: { message: "you can only view your own orders" }
    end
  end

  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end
end
