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
    tax.round(2)
  end

  def total
    total = price * 1.09
    total.round(2)
  end
end
