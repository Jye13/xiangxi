class Category < ApplicationRecord
  has_many :products

  has_many :prices, through: :products
end
