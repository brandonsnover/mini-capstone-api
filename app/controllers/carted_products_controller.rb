class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_product = CartedProduct.create(user_id: current_user.id, product_id: params[:product_id], status: "carted", quantity: 1, order_id: nil)
    if @carted_product.valid?
      render json: { message: "carted_product created" }
    else
      render json: { errors: @carted_product.errors.full_messages }, status: unprocessable_entity
    end
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    if @carted_products != []
      render :index
    else
      render json: { message: "You have no products in your cart" }
    end
  end

  def destroy
    carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
    carted_product.update(status: "removed")
    render json: { message: "Item removed from cart!" }
  end
end
