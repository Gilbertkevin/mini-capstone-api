class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }
  validates :name, uniqueness: true

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def is_discounted?
    if price < 10
      true
    else
      false
    end
  end

  def tax
    tax = price * 0.09
  end

  def total
    total = price + tax
  end
end
