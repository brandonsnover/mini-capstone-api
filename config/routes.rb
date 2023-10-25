Rails.application.routes.draw do
  get "/products.json", controller: "products", action: "index"
  get "/products/:id.json", controller: "products", action: "show"
  post "/products.json", controller: "products", action: "create"
  patch "/products/:id.json", controller: "products", action: "update"
end
