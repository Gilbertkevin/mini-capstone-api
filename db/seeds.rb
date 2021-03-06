# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do
#   product1 = Product.new(name: Faker::Commerce.product_name, price: Faker::Commerce.price, image_url: Faker::Internet.domain_name, description: Faker::Commerce.color)
#   product1.save
# end

products = Product.all

products.each do |product|
  image = Image.new(url: product.image_url, product_id: product.id)
  image.save
end
