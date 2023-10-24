Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "all_products"
  get "/one_product", controller: "products", action: "one_product"
  get "/hammer", controller: "products", action: "hammer"
end
