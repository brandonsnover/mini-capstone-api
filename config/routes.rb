Rails.application.routes.draw do
  get "/products.json", controller: "products", action: "index"
  get "/products/:id.json", controller: "products", action: "show"
end
