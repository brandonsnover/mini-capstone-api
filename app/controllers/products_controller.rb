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
    @product = Product.new(name: "Turtle", price: 11, image_url: "turtle.png", description: "its slow...")
    @product.save
    render :show
  end
end
