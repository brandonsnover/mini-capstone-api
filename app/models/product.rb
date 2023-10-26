class Product < ApplicationRecord
  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    tax = (price * 0.09)
    tax
  end

  def total
    total = price + (price * 0.09)
    total
  end
end
