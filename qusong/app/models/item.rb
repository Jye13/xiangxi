class Item < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_price

  def set_price
    self.price = self.product.price.price1
  end
end
