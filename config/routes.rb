Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # all products
  get "/products" => "products#index"

  # show single product
  get "/products/:id/" => "products#show"

  # create product
  post "/products" => "products#create"

  #update product
  patch "/products/:id" => "products#update"

  #delete recipe
  delete "/products/:id" => "products#destroy"

  #guests
  #users
  #admins

  #signup
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  #create order
  post "/orders" => "orders#create"

  #show order
  get "/orders/:id" => "orders#show"

  #order index
  get "/orders" => "orders#index"
end
