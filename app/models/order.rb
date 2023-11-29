class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products

  def subtotal
    @carted_products = carted_products.where(status: "carted")

    subtotal = 0
    @carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    return subtotal
  end

  def tax
    subtotal * 0.09
  end

  def total
    subtotal + tax
  end
end
