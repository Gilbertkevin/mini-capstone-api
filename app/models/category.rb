class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  # finds all products for a category
  # def products
  #   category_id.find_by(:product_id)
  # end
end
