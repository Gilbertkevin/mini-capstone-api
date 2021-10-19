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
end
