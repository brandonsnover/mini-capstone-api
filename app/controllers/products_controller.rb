class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params["id"])
    render :show
  end

  def create
    @product = Product.new(name: params["name"], price: params["price"], image_url: params["image_url"], description: params["description"], supplier_id: params["supplier_id"])
    @product.save
    if @product.valid?
      render :show
    else
      render json: { errors: @prodcut.errors.full_messages }, status: unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(name: params["name"] || @product.name, price: params["price"] || @product.price, image_url: params["image_url"] || @product.image_url, description: params["description"] || @product.description, supplier_id: params["supplier_id"] || @product.supplier_id)
    if @product.valid?
      render :show
    else
      render json: { errors: @prodcut.errors.full_messages }, status: unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "product destroyed" }
  end
end
