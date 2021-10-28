class User < ApplicationRecord
  has_many :orders

  has_secure_password
  validates :email, presence: true, uniqueness: true
end

# user can view a collection of items
# user can select item to purchase
# brings user to product page
# user can select the quantity to purchase
# user is given subtotal, tax, and total cost
# add in shipping address
# add payment information
# user can confirm purchase
