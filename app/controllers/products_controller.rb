class ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render :index
  end

  def one_product
    @product = Product.first
    render :show
  end

  def hammer
    @product = Product.find_by(name: "Hammer")
    render :show
  end
end
