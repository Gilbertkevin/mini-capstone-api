class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description

  has_many :images
  belongs_to :supplier
end
