class Product < ApplicationRecord
  belongs_to :category

  has_one :price

  def to_s
    self.name
  end
end
