class ProductSerializer < ActiveModel::Serializer
  attributes :name, :price, :image_url, :description, :supplier
end
