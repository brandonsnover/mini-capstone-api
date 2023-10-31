Rails.application.routes.draw do
  get "/products", controller: "products", action: "index"
  get "/products/:id", controller: "products", action: "show"
  post "/products", controller: "products", action: "create"
  patch "/products/:id", controller: "products", action: "update"
  delete "products/:id", controller: "products", action: "destroy"
  get "/suppliers", controller: "suppliers", action: "index"
end
